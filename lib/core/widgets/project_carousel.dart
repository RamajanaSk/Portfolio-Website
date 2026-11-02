import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:ramajana05/Core/widgets/Cards/project_card.dart';
import 'package:ramajana05/data/models/project.dart';

class ProjectCarousel extends StatefulWidget {
  final List<Project> projects;
  final void Function(Project) onProjectTap;

  const ProjectCarousel({
    super.key,
    required this.projects,
    required this.onProjectTap,
  });

  @override
  State<ProjectCarousel> createState() => _ProjectCarouselState();
}

class _ProjectCarouselState extends State<ProjectCarousel> {
  final PageController _controller = PageController();

  Timer? _timer;
  int _currentIndex = 0;

  final Map<int, double> _pageHeights = {};

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();

    if (widget.projects.length <= 1) return;

    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (_) {
        if (!mounted || !_controller.hasClients) return;

        final next = (_currentIndex + 1) % widget.projects.length;

        _goToPage(next);
      },
    );
  }

  void _goToPage(int index) {
    if (!_controller.hasClients) return;
    if (index < 0 || index >= widget.projects.length) return;

    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _updateHeight(int index, double height) {
    if (!mounted || height <= 0) return;

    final previous = _pageHeights[index];

    if (previous != null && (previous - height).abs() < 1) {
      return;
    }

    setState(() {
      _pageHeights[index] = height;
    });
  }

  @override
  void didUpdateWidget(covariant ProjectCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!identical(oldWidget.projects, widget.projects)) {
      _pageHeights.clear();

      if (_currentIndex >= widget.projects.length) {
        _currentIndex = 0;
      }

      _startTimer();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !_controller.hasClients) return;

        if (widget.projects.isNotEmpty) {
          _controller.jumpToPage(_currentIndex);
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  Widget _buildCard(Project project) {
    return ProjectCard(
      title: project.name,
      catchPhrase: project.catchPhrase,
      hexColor: project.hexcolor,
      previewImage: project.previewPicture,
      platformLinks: project.platformLinks,
      date: '${project.startDate.year}',
      githubUrl: project.githubUrl,
      onTap: () => widget.onProjectTap(project),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.projects.isEmpty) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        // Every card is measured at the same width
        // it will receive inside the PageView.
        final measuredWidth = width;

        // Fallback is only used until the first
        // layout measurement is available.
        final activeHeight = _pageHeights[_currentIndex] ??
            _pageHeights.values.firstOrNull ??
            400.0;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Offstage measurement widgets.
            // They participate in layout but are not painted.
            Offstage(
              offstage: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int index = 0; index < widget.projects.length; index++)
                    SizedBox(
                      width: measuredWidth,
                      child: _MeasureSize(
                        onChange: (size) {
                          _updateHeight(index, size.height);
                        },
                        child: _buildCard(widget.projects[index]),
                      ),
                    ),
                ],
              ),
            ),

            AnimatedSize(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: activeHeight,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: widget.projects.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return SizedBox.expand(
                      child: _buildCard(widget.projects[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Reports the actual rendered size of its child.
class _MeasureSize extends SingleChildRenderObjectWidget {
  final ValueChanged<Size> onChange;

  const _MeasureSize({
    required this.onChange,
    required super.child,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderMeasureSize(onChange);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant _RenderMeasureSize renderObject,
  ) {
    renderObject.onChange = onChange;
  }
}

class _RenderMeasureSize extends RenderProxyBox {
  ValueChanged<Size> onChange;

  Size? _oldSize;

  _RenderMeasureSize(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    final newSize = child?.size;

    if (newSize == null || newSize == _oldSize) {
      return;
    }

    _oldSize = newSize;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

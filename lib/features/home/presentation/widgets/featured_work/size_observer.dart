import 'package:flutter/material.dart';

class SizeObserver extends StatefulWidget {
  final Widget child;
  final ValueChanged<Size> onSizeChanged;

  const SizeObserver({
    required this.child,
    required this.onSizeChanged,
  });

  @override
  State<SizeObserver> createState() => _SizeObserverState();
}

class _SizeObserverState extends State<SizeObserver> {
  final GlobalKey _childKey = GlobalKey();

  Size? _lastSize;

  @override
  void initState() {
    super.initState();
    _scheduleMeasurement();
  }

  @override
  void didUpdateWidget(covariant SizeObserver oldWidget) {
    super.didUpdateWidget(oldWidget);
    _scheduleMeasurement();
  }

  void _scheduleMeasurement() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final renderObject = _childKey.currentContext?.findRenderObject();

      if (renderObject is! RenderBox || !renderObject.hasSize) {
        return;
      }

      final size = renderObject.size;

      if (_lastSize != size) {
        _lastSize = size;
        widget.onSizeChanged(size);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _scheduleMeasurement();

    return KeyedSubtree(
      key: _childKey,
      child: widget.child,
    );
  }
}

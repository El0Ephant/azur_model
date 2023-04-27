enum ViewerType {
  glb,
  gif
}

abstract class ViewerTypeMapper {
  static ViewerType isGlb(bool value) {
    if (value) {
      return ViewerType.glb;
    }
    else {
      return ViewerType.gif;
    }
  }
}
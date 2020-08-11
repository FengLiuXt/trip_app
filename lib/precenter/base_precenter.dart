abstract class IBasePrecenter {
  void loadContent();
}

abstract class IPrecenter<T> {
  void loadSuccessful(T t);
}

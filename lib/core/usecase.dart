abstract class Usecase<T, E> {
  Future<E> execute(T input);
}

abstract class Resource<T> {}

class Loading extends Resource {}

class Success<T> extends Resource<T> {
  final T data;
  Success(this.data);
}

class ErrorData<T> extends Resource<T> {
  final String message;
  ErrorData(this.message);
}

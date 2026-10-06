sealed class ResultApi<T> {}

class Success<T> extends ResultApi<T> {
T data;
Success(this.data);
}

class AppError<T> extends ResultApi<T> {
String messageError;
AppError(this.messageError);
}
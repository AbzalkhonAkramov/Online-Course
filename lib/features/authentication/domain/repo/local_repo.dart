abstract class LocalRepository {
  Future<void> saveUserId(String id);
  String? getUserId();
}
class TaskManager {
  static int _nextId = 1; // Initialize the next ID

  static int generateNextId() {
    return _nextId++;
  }
}
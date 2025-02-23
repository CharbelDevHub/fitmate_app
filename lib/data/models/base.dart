abstract class Base {
  // fromJson method will be implemented by each subclass
  factory Base.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError("fromJson must be implemented in subclass");
  }

  // toJson method will be implemented by each subclass
  Map<String, dynamic> toJson();
}
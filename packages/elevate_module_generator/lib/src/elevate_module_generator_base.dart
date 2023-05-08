class ElevateCoreModule {
  const ElevateCoreModule();
}

class ElevateModule {
  const ElevateModule();
}

class Controller {
  final String prefix;
  const Controller({required this.prefix});
}

class Get {
  final String? path;
  const Get({this.path});
}

class Query {
  final String? accessor;
  const Query([this.accessor]);
}

class Param {
  final String? accessor;
  const Param([this.accessor]);
}

class Body {
  final String? accessor;
  const Body([this.accessor]);
}

class Service {
  const Service();
}


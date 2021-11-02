abstract class FailureSearch implements Exception {}

class InvalidTextError implements FailureSearch {}

class DataSourceError implements FailureSearch {}

class DataSourceEmptyError implements FailureSearch {}

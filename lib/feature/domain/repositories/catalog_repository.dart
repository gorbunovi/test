
import 'package:dartz/dartz.dart';
import 'package:test_work/core/error/failure.dart';

abstract class UrlRepository{
  Future<Either<Failure,String>> getUrl();
}
import 'package:test_work/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:test_work/core/error/failure.dart';
import 'package:test_work/feature/domain/repositories/catalog_repository.dart';

class GetUrl extends UseCaseNoParams<String>{
  GetUrl(this.catalogRepository);

  final UrlRepository catalogRepository;

  @override
  Future<Either<Failure, String>> call() async {
    try{
      return catalogRepository.getUrl();
    } catch(e){
     return Left(CacheFailure(e.toString()));
    }
  }
}
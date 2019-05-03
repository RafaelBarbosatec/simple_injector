

abstract class RepositoryTest{
  String getTest();
}

class RepositoryTestImpl implements RepositoryTest{

  @override
  String getTest() {
    return "Call RepositoryTest!!!";
  }

}
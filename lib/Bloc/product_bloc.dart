import 'package:ecommerce/Bloc/block_state.dart';
import 'package:ecommerce/Model/API_Product_Model.dart';
import 'package:ecommerce/Repository/product/product_repository.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc {
  final _repository = ProductRepository();
  final _allDataFetcher = BehaviorSubject<List<APIProductModel>>();
  final _allDataState = BehaviorSubject<BlocState>();

  BehaviorSubject<BlocState> get state => _allDataState;
  Stream<List<APIProductModel>> get allData => _allDataFetcher.stream;
  Stream<BlocState> get allDataState => _allDataState.stream;
  bool _isFetching = false;

  fetchAllData() async {
    if (_isFetching) return;
    _isFetching = true;
    // Start fetching data.
    _allDataState.sink.add(BlocState.fetching);

    // Await response from server.
    final data = await _repository.fetchAllData();
    if (_allDataFetcher.isClosed) return;

    // Adding response data.
    _allDataFetcher.sink.add(data);

    // Complete fetching.
    _allDataState.sink.add(BlocState.completed);
    _isFetching = false;
  }

  dispose() {
    _allDataFetcher.close();
    _allDataState.close();
  }
}
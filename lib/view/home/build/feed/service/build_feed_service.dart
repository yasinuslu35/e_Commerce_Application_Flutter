import 'package:e_commerce_application/view/_product/_utility/service_helper.dart';
import 'package:e_commerce_application/view/_product/enum/network_route_enum.dart';
import 'package:e_commerce_application/view/home/build/feed/model/brand_response_model.dart';
import 'package:e_commerce_application/view/home/build/feed/service/IBuildFeedService.dart';
import 'package:vexana/vexana.dart';

class BuildFeedService extends IBuildFeedService with ServiceHelper {
  BuildFeedService(super.manager, super.scaffoldyKey);

  @override
  Future<List<Data>?> fetchUserHouseList() async {
    final response = await manager.send<BrandResponseModel, BrandResponseModel>(
      NetworkRoutes.BUILD_HOME.rawValue,
      urlSuffix: "getall",
      parseModel: const BrandResponseModel(),
      method: RequestType.GET,
    );
    showMessage(scaffoldyKey, response.error);
    return response.data?.data;
  }
}

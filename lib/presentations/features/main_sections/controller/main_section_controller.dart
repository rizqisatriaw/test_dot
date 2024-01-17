import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_dot/config/themes/color_theme.dart';
import 'package:test_dot/domain/models/gallery_response.dart';
import 'package:test_dot/domain/models/user_response.dart';
import 'package:test_dot/domain/repositories/gallery_repositories.dart';
import 'package:test_dot/domain/repositories/place_repositories.dart';
import 'package:test_dot/domain/repositories/user_repositories.dart';

import '../../../../domain/models/place_response.dart';

class MainSectionController extends GetxController {
  static MainSectionController get to => Get.find();

  final TextEditingController searchController = TextEditingController();

  /// Place
  final RxList<Content> content = RxList.empty();
  final RxList<Content> contentLocal = RxList.empty();

  /// Gallery
  final RxList<Datum> contentGallery = RxList.empty();
  final RxList<Datum> contentLocalGallery = RxList.empty();

  /// User
  final Rx<User>? user = User().obs;

  /// tab index
  RxInt currentPage = RxInt(0);

  @override
  void onInit() {
    super.onInit();

    getPlaceData();
    getGalleryData();
    getUser();
  }

  Future<void> getPlaceData() async {
    final data = await PlaceRepositories().getPlaceData();
    log(data.toString());
    if (data != null) {
      content.addAll(data.data?.content ?? []);
      contentLocal.addAll(data.data?.content ?? []);
    } else {
      Get.snackbar(
        'Data is Empty',
        'Please try again later',
        backgroundColor: ColorThemes.white,
      );
    }
  }

  Future<void> getGalleryData() async {
    final data = await GalleryRepositories().getGalleryData();
    log(data.toString());
    if (data != null) {
      contentGallery.addAll(data.data ?? []);
      contentLocalGallery.addAll(data.data ?? []);
    } else {
      Get.snackbar(
        'Data is Empty',
        'Please try again later',
        backgroundColor: ColorThemes.white,
      );
    }
  }

  Future<void> getUser() async {
    final data = await UserRepositories().getUserData();
    log(data.toString());
    if (data != null) {
      user?.value = data.data ?? User();
    } else {
      Get.snackbar(
        'Data is Empty',
        'Please try again later',
        backgroundColor: ColorThemes.white,
      );
    }
  }

  void search(String text) {
    final searchData = content
        .where((item) => item.title!.toLowerCase().contains(text))
        .toList();
    contentLocal.assignAll(searchData);
  }

  void searchGallery(String text) {
    final searchData = contentGallery
        .where((item) => item.caption!.toLowerCase().contains(text))
        .toList();
    contentLocalGallery.assignAll(searchData);
  }

  void updateTab(int newTab) {
    currentPage.value = newTab;
  }
}

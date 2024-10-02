import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_project/src/model/groupModel.dart';

class Groupselectradioitem extends StatelessWidget {
  final StyleRadioModel _item;
  Groupselectradioitem(this._item);

  @override
  Widget build(BuildContext context) {
    // 화면에 맞춰 위젯과 텍스트 크기를 조절할 수 있는 반응형 초기화 코드
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 3.h),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
              height: 40.h,
              child: Center(
                child: Text(
                  _item.groupName,
                  style: TextStyle(
                    color: _item.isSelected
                        ? Color.fromRGBO(97, 136, 84, 1)
                        : Color.fromRGBO(169, 202, 157, 1),
                    fontSize: 20.sp,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: _item.isSelected
                    ? Color.fromRGBO(245, 208, 67, 1)
                    : Color.fromRGBO(255, 249, 227, 1),
                border: Border.all(
                  width: 0.2,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

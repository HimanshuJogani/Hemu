import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomSheet bottomSheet = BottomSheet(
        onClosing: () {},
        builder: (context2) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  "Choose",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Icon(Icons.camera),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "TakePicture",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(Icons.file_upload_outlined),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "UploadPicture",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          );
        });

    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    // showModalBottomSheet(
                    //     context: context,
                    //     builder: (context) {
                    //       return bottomSheet;
                    //     });
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 66,
                    child: CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeKOAl1W8tSBWkHF730mDqM3kDsaUw_fwtBg&usqp=CAU'),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                        onTap: () {
                          // showModalBottomSheet(
                          //     context: context,
                          //     builder: (context) {
                          //       return bottomSheet;
                          //     });
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 21,
                          child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 18,
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              )),
                        )))
              ],
            ),
          )
        ],
      ),
    );
  }
}

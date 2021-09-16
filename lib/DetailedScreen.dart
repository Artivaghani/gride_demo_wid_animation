import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailedScreen extends StatefulWidget {
  final int index;
  final String img;
  const DetailedScreen(this.index, this.img, {Key? key}) : super(key: key);

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Container(
            color: Colors.white70,
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
            child: Stack(
              children: [
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().screenHeight,
                  margin: EdgeInsets.fromLTRB(ScreenUtil().setHeight(35), ScreenUtil().setHeight(50),0.0,0.0),
                  child: Card(
                      shape : RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),),
                      elevation : ScreenUtil().setHeight(10),
                    shadowColor: Colors.orange,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: ScreenUtil().setHeight(5),top: ScreenUtil().setHeight(15)),
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Container(
                        height:ScreenUtil().setHeight(150),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Hero(
                                tag: 'big${widget.index}',
                                child: Image.asset(widget.img,width:ScreenUtil().setHeight(150))),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height:ScreenUtil().setHeight(10) ,),
                                  Text('Mango',overflow:TextOverflow.ellipsis,style: TextStyle(color: Colors.black87,fontSize: 24,fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                                  SizedBox(height:ScreenUtil().setHeight(6) ,),
                                  Text('Rs. 14.00/Kg',overflow:TextOverflow.ellipsis,style: TextStyle(color: Colors.orange,fontSize: 16,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),

                                ],
                              ),
                            ),
                          ],
                        ),),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(ScreenUtil().setHeight(45), ScreenUtil().setHeight(14),ScreenUtil().setHeight(10),ScreenUtil().setHeight(10)),
                          child: ListView(
                              children: [
                                Text('Description',overflow:TextOverflow.ellipsis,style: TextStyle(color: Colors.black87,fontSize: 18,fontStyle: FontStyle.normal,fontWeight: FontWeight.w600,),textAlign: TextAlign.left,),
                                SizedBox(height:ScreenUtil().setHeight(8) ,),
                                Text('A mango is an edible stone fruit produced by the tropical tree Mangifera indica which is believed to have originated from the region between northwestern Myanmar, Bangladesh, and northeastern India. M. indica has been cultivated in South and Southeast Asia since ancient times resulting in two distinct types of modern mango cultivars: the "Indian type" and the "Southeast Asian type".[1][2] Other species in the genus Mangifera also produce edible fruits that are also called "mangoes", the majority of which are found in the Malesian ecoregion',style: TextStyle(color: Colors.black,fontSize: 14,fontStyle: FontStyle.normal,fontWeight: FontWeight.w200,),textAlign: TextAlign.left,),
                                SizedBox(height:ScreenUtil().setHeight(20) ,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Total',overflow:TextOverflow.ellipsis,style: TextStyle(color: Colors.black87,fontSize: 24,fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                                          SizedBox(height:ScreenUtil().setHeight(6) ,),
                                          Text('Rs. 28.00',overflow:TextOverflow.ellipsis,style: TextStyle(color: Colors.orange,fontSize: 16,fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                                        ],
                                      ),
                                    ),
                                    Expanded(child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset('images/removeitem.png',width: ScreenUtil().setHeight(30),height: ScreenUtil().setHeight(35),),
                                          SizedBox(width:ScreenUtil().setHeight(4) ,),
                                          Text('2 kg',overflow:TextOverflow.ellipsis,style: TextStyle(color: Colors.black87,fontSize: 18,fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                                          SizedBox(width:ScreenUtil().setHeight(4) ,),
                                          Image.asset('images/plusitem.png',width: ScreenUtil().setHeight(30),height: ScreenUtil().setHeight(35),)
                                        ],
                                      ),)
                                  ],
                                ),
                                SizedBox(height:ScreenUtil().setHeight(30) ,),
                                Container(
                                  margin: EdgeInsets.only(left:ScreenUtil().setHeight(50),right: ScreenUtil().setHeight(50) ),
                                  child: TextButton(
                                      child: Text(
                                          "Place Order",
                                        overflow:TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontSize: 18,fontStyle: FontStyle.normal,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,),
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                                          backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(25),
                                                  side: BorderSide(color: Colors.orange)
                                              )
                                          )
                                      ),
                                      onPressed: () => null
                                  ),
                                ),
                              ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SpaceGridView extends StatelessWidget {
  void _clickImage() {
    print('click image');
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
  primary: false,
  //padding: const EdgeInsets.all(20),
  //crossAxisSpacing: 10,
  //mainAxisSpacing: 10,
  crossAxisCount: 2,
  children: <Widget>[
    GestureDetector(
            onTap: () {
              _clickImage();
            },
              child: Column( 
                children: <Widget>[
                   Flexible(
                    fit: FlexFit.tight,
                    child: new Image.network(
                       "https://cdn.vox-cdn.com/thumbor/QmYUW4WDPUe5cakWg1doB00HdBk=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19656977/5986912410_682fed19e2_b.jpg",
                      fit: BoxFit.cover,
                    )),
                ]
              ),
            
    ),
     GestureDetector(
            onTap: () {
              _clickImage();
            },
              child: Column( 
                children: <Widget>[
                   Flexible(
                    fit: FlexFit.tight,
                    child: new Image.network(
                       "https://www.gannett-cdn.com/presto/2020/09/02/USAT/230e4ee9-0e0d-4f8e-b32a-85fbe0d3550e-BTS.jpg",
                      fit: BoxFit.cover,
                    )),
                ]
              ),
            
    ),
     GestureDetector(
           onTap: () {
              _clickImage();
            },
              child: Column( 
                children: <Widget>[
                   Flexible(
                    fit: FlexFit.tight,
                    child: new Image.network(
                       "https://pyxis.nymag.com/v1/imgs/f22/cee/18a5c624814d1fee69692841d2f92e89ad-21-homer-bushes-lede.rhorizontal.w700.jpg",
                      fit: BoxFit.cover,
                    )),
                ]
              ),
            
    ),
     GestureDetector(
            onTap: () {
              _clickImage();
            },
              child: Column( 
                children: <Widget>[
                   Flexible(
                    fit: FlexFit.tight,
                    child: new Image.network(
                       "https://cnet3.cbsistatic.com/img/C_J1PUATAExNP3p1z2e0x083KEk=/0x154:1000x778/1200x675/2020/10/21/9f706d3a-dc30-4937-8195-47aa345288e5/promofinal.jpg",
                      fit: BoxFit.cover,
                    )),
                ]
              ),
            
    ),
    ],
  );
  }
}

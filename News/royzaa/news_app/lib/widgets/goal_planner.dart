import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoalPlanner extends StatelessWidget {
  const GoalPlanner({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.none,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Goal Planner',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300.withOpacity(0.6),
                    blurRadius: 25,
                    offset: Offset(0, 5),
                    spreadRadius: 10,
                  ),
                ]),
                child: SvgPicture.asset(
                  'assets/images/2.svg',
                  width: width,
                  height: height,
                  colorBlendMode: BlendMode.color,
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(
                height: height,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Cari tahu portofolio sesuai tujuan investasimu',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(45)),
                      child: const Text(
                        'Mulai',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

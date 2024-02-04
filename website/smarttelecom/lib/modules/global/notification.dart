// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:motion_toast/motion_toast.dart';

SnackBar errorMessage(String message) => SnackBar(
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 90,
            decoration: const BoxDecoration(
              color: Color(0xFFC72C41),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              children: [
                const SizedBox(width: 48),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Error!",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const Spacer(),
                      Text(
                        message,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
              child: SvgPicture.asset(
                "images/notification/bubbles.svg",
                key: null,
                height: 48,
                width: 40,
                color: const Color(0xFF801336),
              ),
            ),
          ),
          Positioned(
            top: -20,
            left: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  "images/notification/fail.svg",
                  height: 40,
                ),
                Positioned(
                  top: 10,
                  child: SvgPicture.asset(
                    "images/notification/close.svg",
                    height: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
    );

SnackBar successMessage(String message) => SnackBar(
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 90,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 44, 199, 114),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              children: [
                const SizedBox(width: 48),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Exito!",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const Spacer(),
                      Text(
                        message,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
              child: SvgPicture.asset(
                "images/notification/bubbles.svg",
                key: null,
                height: 48,
                width: 40,
                color: const Color.fromARGB(255, 0, 160, 85),
              ),
            ),
          ),
          Positioned(
            top: -20,
            left: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  "images/notification/fail.svg",
                  height: 40,
                ),
                Positioned(
                  top: 10,
                  child: SvgPicture.asset(
                    "images/notification/close.svg",
                    height: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
    );

MotionToast errorCon(String message) => MotionToast(
      title: const Text("Error!"),
      description: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 100,
            width: 300,
            decoration: const BoxDecoration(
              color: Color(0xFFC72C41),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              children: [
                const SizedBox(width: 48),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Error!",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const Spacer(),
                      Text(
                        message,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
              child: SvgPicture.asset(
                "images/notification/bubbles.svg",
                key: null,
                height: 48,
                width: 40,
                color: const Color(0xFF801336),
              ),
            ),
          ),
          Positioned(
            top: -20,
            left: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  "images/notification/fail.svg",
                  height: 40,
                ),
                Positioned(
                  top: 10,
                  child: SvgPicture.asset(
                    "images/error/close.svg",
                    height: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      primaryColor: const Color(0xFFC72C41),
      position: MotionToastPosition.top,
      displaySideBar: false,
    );

import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  // NOTE : 0. AVAILABLE 1. SELECTED 2. UNVAILABLE
  // final int status;
  final bool isAvailable;
  final String id;

  const SeatItem({
    Key? key,
    // required this.status,
    required this.id,
    this.isAvailable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (!isAvailable) {
        return kUnvailableColor;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kAvailableColor;
        }
      }
      // switch (status) {
      //   case 0:
      //     return kAvailableColor;
      //   case 1:
      //     return kPrimaryColor;
      //   case 2:
      //     return kUnvailableColor;
      //   default:
      //     return kUnvailableColor;
      // }
    }

    borderColor() {
      if (!isAvailable) {
        return kUnvailableColor;
      } else {
        return kPrimaryColor;
      }
      // switch (status) {
      //   case 0:
      //     return kPrimaryColor;
      //   case 1:
      //     return kPrimaryColor;
      //   case 2:
      //     return kUnvailableColor;
      //   default:
      //     return kUnvailableColor;
      // }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: whiteTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
        );
      } else {
        return SizedBox();
      }
      // switch (status) {
      //   case 0:
      //     return SizedBox();
      //   case 1:
      //     return Center(
      //       child: Text(
      //         'YOU',
      //         style: whiteTextStyle.copyWith(
      //           fontWeight: semiBold,
      //         ),
      //       ),
      //     );
      //   case 2:
      //     return SizedBox();
      //   default:
      //     return SizedBox();
      // }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor(),
            width: 2,
          ),
        ),
        child: child(),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EmployeeCardItem extends StatelessWidget {
  const EmployeeCardItem({
    Key? key,
    this.employeeId,
    this.firstName,
    this.lastName,
    this.pictureUrl,
    this.fisPrepaidCardNo,
    this.cellPhoneNo,
    this.emailAddress,
  }) : super(key: key);

  final String? employeeId;
  final String? firstName;
  final String? lastName;
  final String? pictureUrl;
  final String? fisPrepaidCardNo;
  final String? cellPhoneNo;
  final String? emailAddress;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        height: 150,
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: pictureUrl!,
                  imageBuilder: (context, image) => CircleAvatar(
                    backgroundImage: image,
                    radius: 40,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 2),
                      width: 150,
                      color: Theme.of(context).colorScheme.secondary,
                      height: 2,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "$lastName, $firstName",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(cellPhoneNo ?? ""),
                    Text(employeeId ?? ""),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      fisPrepaidCardNo ?? 'No Prepaid Card Assigned',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

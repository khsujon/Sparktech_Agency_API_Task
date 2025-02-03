import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/login_viewmodel.dart';
import '../viewmodels/user_viewmodel.dart';

class UserDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final userViewModel = Provider.of<UserViewModel>(context);

    // Fetch user details if not already fetched
    if (userViewModel.userDetails == null && !userViewModel.isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        userViewModel.fetchUserDetails(
            Provider.of<LoginViewModel>(context, listen: false).accessToken!);
      });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User Details'),
      ),
      body: userViewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.05,
                  ),
                  // Profile Picture
                  Padding(
                    padding: EdgeInsets.all(width * 0.05),
                    child: CircleAvatar(
                      radius: width * 0.2,
                      backgroundImage: userViewModel
                                  .userDetails?.data?.profilePicture !=
                              null
                          ? NetworkImage(
                              userViewModel.userDetails!.data!.profilePicture!)
                          : null,
                      backgroundColor: Colors.grey[300],
                      child: userViewModel.userDetails?.data?.profilePicture ==
                              null
                          ? Icon(Icons.person, size: 80, color: Colors.white)
                          : null,
                    ),
                  ),

                  // Full Name
                  Text(
                    '${userViewModel.userDetails?.data?.firstName ?? ''} ${userViewModel.userDetails?.data?.lastName ?? ''}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  // Role
                  Text(
                    'Role: ${userViewModel.userDetails?.data?.role ?? 'N/A'}',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),

                  SizedBox(
                    height: height * 0.03,
                  ),

                  // Email
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.blue),
                    title: Text(
                      'Email: ${userViewModel.userDetails?.data?.email ?? 'N/A'}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),

                  // Contact
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.green),
                    title: Text(
                      'Contact: ${userViewModel.userDetails?.data?.contact ?? 'N/A'}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),

                  // Status
                  ListTile(
                    leading: Icon(Icons.info, color: Colors.orange),
                    title: Text(
                      'Status: ${userViewModel.userDetails?.data?.status ?? 'N/A'}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

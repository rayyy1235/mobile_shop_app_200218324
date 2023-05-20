import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'John Doe';
  String address = '123 Main Street';
  String phoneNumber = '123-456-7890';
  String groupName = '';
  String skills = '';

  void _editName() async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        String newName = name;

        return AlertDialog(
          title: const Text('Edit Name'),
          content: TextField(
            onChanged: (value) {
              newName = value;
            },
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                Navigator.of(context).pop(newName);
              },
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        name = result;
      });
    }
  }

  void _editAddress() async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        String newAddress = address;

        return AlertDialog(
          title: const Text('Edit Delivery Address'),
          content: TextField(
            onChanged: (value) {
              newAddress = value;
            },
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                Navigator.of(context).pop(newAddress);
              },
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        address = result;
      });
    }
  }

  void _editPhoneNumber() async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        String newPhoneNumber = phoneNumber;

        return AlertDialog(
          title: const Text('Edit Phone Number'),
          content: TextField(
            onChanged: (value) {
              newPhoneNumber = value;
            },
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                Navigator.of(context).pop(newPhoneNumber);
              },
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        phoneNumber = result;
      });
    }
  }

  void _editGroupName() async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        String newGroupName = groupName;

        return AlertDialog(
          title: const Text('Edit Group Name'),
          content: TextField(
            onChanged: (value) {
              newGroupName = value;
            },
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                Navigator.of(context).pop(newGroupName);
              },
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        groupName = result;
      });
    }
  }

  void _editSkills() async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        String newSkills = skills;

        return AlertDialog(
          title: const Text('Edit Skills'),
          content: TextField(
            onChanged: (value) {
              newSkills = value;
            },
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                Navigator.of(context).pop(newSkills);
              },
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        skills = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          const CircleAvatar(
            radius: 64,
            child: Icon(
              Icons.person,
              size: 64,
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Name'),
            subtitle: Text(name),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: _editName,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Delivery Address'),
            subtitle: Text(address),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: _editAddress,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Phone Number'),
            subtitle: Text(phoneNumber),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: _editPhoneNumber,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Group Name'),
            subtitle: Text(groupName),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: _editGroupName,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Skills'),
            subtitle: Text(skills),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: _editSkills,
            ),
          ),
        ],
      ),
    );
  }
}

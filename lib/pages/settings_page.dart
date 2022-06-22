import 'dart:ui';

import 'package:blockchain/color.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({ Key? key }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

final icons = [
  Icon(Icons.wallet_travel_rounded),
  Icon(Icons.swap_horiz_rounded),
  Icon(Icons.arrow_circle_down_rounded),
  Icon(Icons.circle_rounded)
];

final title = ['Addresses','Exchange','Airdrops', 'Log in to Web Wallet'];

final profileTitle =['Wallet ID', 'Your Email', 'Mobile', 'Exchange', 'Limits & Features'];
final profileSub = ['08604gyt-0845-73c9-3623-d4t56h567s2f', 'example@email.com', 'not specified', ' ', 'Trading Accounts'];

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Settings",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          automaticallyImplyLeading: true,
          leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black54,), onPressed: (){
            Navigator.pop(context, false);
          },),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chat_bubble_rounded,
                  color: Colors.grey,
                  size: 30,
                )),

                const SizedBox(width: 4,)
          ],
      ),
      body: ListView(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: title.length,
              shrinkWrap: true,
              itemBuilder: (context, index){
                return ListTile(
                  leading: icons[index],
                  title: Text(title[index], style: const TextStyle(fontWeight: FontWeight.w700),),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                );
              }
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 20,vertical: 10),
              child: Text('Profile', style: TextStyle(color: primaryColor, fontWeight: FontWeight.w500),),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: profileTitle.length,
              shrinkWrap: true,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(profileTitle[index], style: const TextStyle(fontWeight: FontWeight.w600),),
                  subtitle: Text(profileSub[index], style:const TextStyle(color: Colors.grey),),
            
                );
              }
            ),
            const Divider(height: 1,),
             const Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 20,vertical: 10),
              child: Text('Preference', style: TextStyle(color: primaryColor, fontWeight: FontWeight.w500),),
            ),
            ListTile(
                  title: const Text('Local Currency', style:  TextStyle(fontWeight: FontWeight.w600),),
                  subtitle:  Text('USD', style: TextStyle(color: Colors.grey[500]!))
            ),
            ListTile(
                  title:  const Text('Email Notifications', style:  TextStyle(fontWeight: FontWeight.w600),),
                  trailing: Switch(
                    value: isSwitched,
                    onChanged: toggleSwitch,
                    activeColor: primaryColor,),
            ),
            ListTile(
                  title:  const Text('Push Notifications', style:  TextStyle(fontWeight: FontWeight.w600),),
                  trailing: Switch(
                    value: isSwitched,
                    onChanged: toggleSwitch,
                    activeColor: primaryColor,),
            ),
            const Divider(height: 1,),
             const Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 20,vertical: 10),
              child: Text('Security', style: TextStyle(color: primaryColor, fontWeight: FontWeight.w500),),
            ),
            const ListTile(
                  title: Text('Change PIN', style:  TextStyle(fontWeight: FontWeight.w600),),
            ),
            const ListTile(
                  title: Text('Change Password', style:  TextStyle(fontWeight: FontWeight.w600),),
            ),
            ListTile(
                  title:  const Text('Biometric Unlock', style:  TextStyle(fontWeight: FontWeight.w600),),
                  trailing: Switch(
                    value: isSwitched,
                    onChanged: toggleSwitch,
                    activeColor: primaryColor,),
            ),
            const ListTile(
                  title: Text('Secret Private Key Recovery Pharse', style:  TextStyle(fontWeight: FontWeight.w600),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                    title:  const Text('2-Step Verification', style:  TextStyle(fontWeight: FontWeight.w600),),
                    subtitle: Text('Protect your wallet from unauthorized access by enabling 2-Step Verification.', style: TextStyle(color: Colors.grey[500]!)) ,
                    trailing: Switch(
                      value: isSwitched,
                      onChanged: toggleSwitch,
                      activeColor: primaryColor,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                    title:  const Text('Enable Screenshots', style:  TextStyle(fontWeight: FontWeight.w600),),
                    subtitle: Text('Some screens within the application can display sensitive data. Other applications will be able to access these screenshots.', style: TextStyle(color: Colors.grey[500]!)) ,
                    trailing: Switch(
                      value: isSwitched,
                      onChanged: toggleSwitch,
                      activeColor: primaryColor,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                    title:  const Text('Block Tor Request', style:  TextStyle(fontWeight: FontWeight.w600),),
                    subtitle: Text('Block IP addresses that are known to be part of the Tor anonymizing network. The Tor network is frequently used by hackers attempting to access Blockchain user\'s wallets. ', style: TextStyle(color: Colors.grey[500]!)) ,
                    trailing: Switch(
                      value: isSwitched,
                      onChanged: toggleSwitch,
                      activeColor: primaryColor,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                    title:  const Text('Launcher Shortcuts', style:  TextStyle(fontWeight: FontWeight.w600),),
                    subtitle: Text('Reveal a receive address when you long-press on the app icon in the launcher, making receiving bitcoin even faster.', style: TextStyle(color: Colors.grey[500]!)) ,
                    trailing: Switch(
                      value: isSwitched,
                      onChanged: toggleSwitch,
                      activeColor: primaryColor,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                    title:  const Text('Enable Cloud Backups', style:  TextStyle(fontWeight: FontWeight.w600),),
                    subtitle: Text('Store the encrypted backup in your Goofle Drive account, if available. This allows you to restore your wallet if you lose this device.', style: TextStyle(color: Colors.grey[500]!)) ,
                    trailing: Switch(
                      value: isSwitched,
                      onChanged: toggleSwitch,
                      activeColor: primaryColor,),
              ),
            ),
            const Divider(height: 1),
            const Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 20,vertical: 10),
              child: Text('App', style: TextStyle(color: primaryColor, fontWeight: FontWeight.w500),),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                    title:  Text('About Us', style:  TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[500]!),),
                    subtitle: Text('Blockchain Wallet v202202.1.2 (18741) \nc 2022 Blockchain Luxembourg S.A.\nAll rights reserved. ', style: TextStyle(color: Colors.grey[500]!)) ,
                    trailing: Switch(
                      value: isSwitched,
                      onChanged: toggleSwitch,
                      activeColor: primaryColor,),
              ),
            ),
            const ListTile(
              title: Text('Terms of Service',  style:  TextStyle(fontWeight: FontWeight.w600),),
            ),
            const ListTile(
              title: Text('Privacy Policy', style:  TextStyle(fontWeight: FontWeight.w600),),
            ),
            const Padding(
              padding:  EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.exit_to_app_rounded),
                title: Text('Logout',  style:  TextStyle(fontWeight: FontWeight.w600),),
                trailing: Icon(Icons.keyboard_arrow_right_rounded),
              ),
            ),
          ],
        )
      );
  }

  void toggleSwitch(bool value){
    if(isSwitched == false){
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

}
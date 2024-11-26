class AppLinks {
  static const String server = "http://10.0.2.2/Chinese_Language";
  // static const String server = "http://127.0.0.1/Chinese_Language";

  static const String imagestatic = "$server/upload";
  // ======================images============================
  static const String imagecars = "$imagestatic/Cars";
  // static const String imageitem="$imagestatic/item";
  // ======================================================

  // //****************Auth***************** */
  static const String signup = "$server/Auth/signUp.php";
  static const String verfycode = "$server/Auth/verfiycode.php";
  static const String login = "$server/Auth/login.php";
  static const String resendVerfycode = "$server/Auth/Resend.php";
  static const String edituserdata = "$server/Auth/edit.php";
  /////////////////forget password//////////////////////
  static const String chechemail = "$server/ForgetPassword/checkEmail.php";
  static const String verfiycodeforgetpass =
      "$server/ForgetPassword/verfycode.php";
  static const String resetpassword =
      "$server/ForgetPassword/ResetPassword.php";

  ///////////////////////////////////////////////////////////////////////////////////////

  //////////////Vocabularies/////////////////////////
  static const String vocabulariesview = "$server/Vocabularies/view.php";
  static const String vocabulariesadd = "$server/Vocabularies/add.php";
  static const String vocabulariesedit = "$server/Vocabularies/edit.php";
  static const String vocabulariesdelete = "$server/Vocabularies/delete.php";

  //////////////Sentences/////////////////////////
  static const String sentencesview = "$server/Sentences/view.php";
  static const String sentencesadd = "$server/Sentences/add.php";
  static const String sentencesedit = "$server/Sentences/edit.php";
  static const String sentencesdelete = "$server/Sentences/delete.php";

  //////////////Letters/////////////////////////
  static const String lettersview = "$server/Letters/view.php";
  static const String lettersadd = "$server/Letters/add.php";
  static const String lettersedit = "$server/Letters/edit.php";
  static const String lettersdelete = "$server/Letters/delete.php";

  //////////////Scores/////////////////////////
  static const String addscores = "$server/scores.php";

  //////////////UsersInfo/////////////////////////
  static const String usersinfo = "$server/usersInfo.php";
  static const String deleteusersinfo = "$server/deleteuser.php";

  ///////////////////////////////////////////////////////////////////////////////////////

  ///////////////Notification////////////////////
  static const String notifications = "$server/Notification.php";

  //////////////CommunityInfo/////////////////////////
  static const String communityinfo = "$server/community.php";
}

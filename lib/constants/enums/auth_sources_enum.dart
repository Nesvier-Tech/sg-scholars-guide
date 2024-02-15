enum AuthSourcesEnum {
  emailAndPassword('Email and Password'),
  googleSignIn('Google Sign-in'),
  facebookSignIn('Facebook Sign-in'),
  appleSignIn('Apple Sign-in'),
  phoneNumberSignIn('Phone Number Sign-in'),
  other('Other');

  const AuthSourcesEnum(this.name);
  final String name;
}

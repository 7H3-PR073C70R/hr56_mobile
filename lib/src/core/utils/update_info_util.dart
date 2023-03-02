String pageTitle(int index) {
  return index == 6
      ? 'Add Bank'
      : index == 2
          ? 'Employment Details'
          : 'Verify your profile';
}

String? successMessageTitle(int index) {
  switch (index) {
    case 1:
      return 'Personal Information\nSaved. Great Job';
    case 2:
      return 'Employment Details\nSaved';
    case 3:
      return 'Selfie Upload Successful!';
    case 4:
      return 'Congratulations! ID\nVerified Successfully!';
    case 5:
      return 'Utility Bill Upload\nSuccessful!';
    case 7:
      return 'Bank added\nsuccessfully!';
    default:
      return null;
  }
}

String? successMessageSubTitle(int index) {
  switch (index) {
    case 2:
      return 'You are almost there!';
    case 5:
      return 'You will be notified once verification is complete.';
    default:
      return null;
  }
}

String? errorMessageSubTitle(int index) {
  switch (index) {
    case 4:
      return 'Please try again the information provided does not '
          'match We are not able to verify your information at this time';
    case 5:
      return 'Please try again';
    default:
      return null;
  }
}

String? errorMessageTitle(int index) {
  switch (index) {
    case 3:
      return 'Ooops....Selfie Upload Failed';
    case 4:
      return 'Ooops....Verification Failed';
    case 5:
      return 'Ooops....Utility Bill\nUpload Failed';
    default:
      return null;
  }
}

String? processingMessage(int index) {
  switch (index) {
    case 4:
      return 'You will be notified once\nverification is Successful.';
    default:
      return null;
  }
}

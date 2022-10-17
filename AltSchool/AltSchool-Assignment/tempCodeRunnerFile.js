function allLowerCaseLetters(string) {
    let newStr = "";
    
    for (ch of string) {
        convert = ch.toLowerCase()
            if(convert === ch)
        newStr += convert;
    }
    return newStr;
}
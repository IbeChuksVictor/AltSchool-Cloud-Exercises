// /* 
// You have an array of objects that contains name,
// age and gender of different students. 
// Your task is to return the total ages of male and 
// female students that are not older than 25, i.e people that are aged 25 or less
// */
// const students = [
//     {name: "Mary", age: 35, gender: "female"},
//     {name: "Stephen", age: 20, gender: "male"},
//     {name: "Dave", age: 15, gender: "male"},
//     {name: "Jane", age: 25, gender: "female"},
//     {name: "John", age: 10, gender: "male"},
//     {name: "Fred", age: 50, gender: "female"},
//     {name: "Caleb", age: 46, gender: "male"},
// ]




// // function totalAgesOfStudents(arrayOfObjects) {
//     let sumOfMaleAges = 0;
//     let sumofFemaleAges = 0;

//     for(let i = 0; i < students.length; i++) {
//         if((students[i].age <= 25) && (students[i].gender === "male")) {
//             sumOfMaleAges += students[i].age;
//         } else if ((students[i].age <= 25) && (students[i].gender === "female")){
//             sumofFemaleAges += students[i].age;
//         }          
//     }
//     console.log(sumOfMaleAges, sumofFemaleAges);
// }
// student.totalAgesOfStudents = totalAgesOfStudents;

function allLowerCaseLetters(string) {
    let newStr = "";
    
    for (ch of string) {
        if(ch.toLowerCase() === ch)
        newStr += ch;
    }
    return newStr;
}
// const allLowerCaseLetters = (string) => {
//     let newStr = "";
//     for(const ch of string)
//     (ch.toLowerCase() == ch) && (newStr += ch);
//     return newStr;
// }

s = "MaLe";

console.log(allLowerCaseLetters(s))

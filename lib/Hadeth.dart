
import 'package:flutter/services.dart';

void loadHadethFile(AllHadeth allHadeth,Function _setState)async{
  List<Hadeth> list= [];
  String fileContent = await rootBundle.loadString('assets/content/ahadeth.txt');
  List<String> allHadethConent = fileContent.split('#\r\n');
  print(allHadethConent.length);
  for(int i=0;i<allHadethConent.length;i++){
    String hadethContent = allHadethConent[i];
    List<String> hadethLines = hadethContent.split('\n');
    String title = hadethLines[0];// title
    String content = '';
    for(int j =1;j<hadethLines.length;j++){
      content = content+ ' '+hadethLines[j];
    }
    Hadeth hadeth = Hadeth(title, content);
    list.add(hadeth);
  }

  _setState((){
    allHadeth.hadethList=list;
  });

}

class Hadeth {
  String title;
  String content;

  Hadeth(this.title, this.content);
}
class AllHadeth{
  List<Hadeth> hadethList=[];
}
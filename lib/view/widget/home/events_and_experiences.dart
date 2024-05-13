 import 'package:flutter/material.dart';

class EventsAndExperiences extends StatelessWidget {
  const EventsAndExperiences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.only(left: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            EventsAndExperiencesItems(
              newnumber:'1',
              title: 'عربيتك في أمان',
              description: 'قناة السويس للتأمين تحقق 1.37 مليار جنيه أقساط.. وتسدد 353 مليونا لعملائها.',
              lessonsCount: '13 Feb, Sunday ',
              imagePath: 'assets/images/news3.jpg',

            ),
            EventsAndExperiencesItems(
              newnumber:'2',
              title: 'عربيتك في أمان',
              description: 'شركة جو جلوبال للاستشارات العامة  وبالتعاون مع شركة HM Actuarial Consultancy  بقيادة د. حسين عبد الغفار تفخر بأن تطبق المعيار " IFRS 17"',
              lessonsCount: '13 Feb, Sunday ',
              imagePath: 'assets/images/news1.jpg',

            ),
            EventsAndExperiencesItems(
              newnumber:'3',
              title: 'وفر وقتك واشتري رحلتك',
              description: 'دلوقتي تقدر تسدد وثيقة التأمين الخاصة بيك بطريقة اسهل و اسرع .              من خلال موقعنا الالكتروني',
              lessonsCount: '13 Feb, Sunday',
              imagePath: 'assets/images/news2.jpg',
            ),

          ],
        ),
      ),
    );
  }
}

class EventsAndExperiencesItems extends StatelessWidget {
  const EventsAndExperiencesItems({
    Key? key, required this.newnumber, required this.title, required this.description, required this.lessonsCount, required this.imagePath,
  }) : super(key: key);
  final String newnumber;
  final String title;
  final String description;
  final String lessonsCount;
  final String imagePath;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 20,bottom: 20),
        width: 250,
        height: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 10
            )],
            borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 150,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all( 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
               /*     Text(title,style: Theme.of(context).textTheme.bodyText2,),*/
                    Text(description,style: Theme.of(context).textTheme.bodyText1,),
                /*    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(lessonsCount,style: TextStyle(fontSize: 10),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.blue,width: 1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))
                          ),
                          onPressed: (){
                            if(newnumber=="1")
                              {

                              }
                            else
                              {

                              }

                          },
                            child: const Text('تفاصيل الخبر'),
                        )

                      ],
                    )*/
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


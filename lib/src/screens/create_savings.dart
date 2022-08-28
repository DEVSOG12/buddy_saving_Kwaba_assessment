import 'package:buddy_savings/src/utils/button.dart';
import 'package:buddy_savings/src/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class CreateSavings extends StatefulWidget {
  const CreateSavings({Key? key}) : super(key: key);

  @override
  State<CreateSavings> createState() => _CreateSavingsState();
}

class _CreateSavingsState extends State<CreateSavings> {
  TextEditingController titleSavingController = TextEditingController();
  TextEditingController savingCountController = TextEditingController();
  TextEditingController savingDescription = TextEditingController();
  TextEditingController savingAmount = TextEditingController();
  TextEditingController savingDate = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  int selection = 0;
  bool isTargetWanted = false;
  int selectTarget = -1;
  int selectFrequency = -1;
  int selectSavingTime = -1;
  DateTime selectedDate = DateTime.now();
  bool automaticselected = true;
  String relationship = 'Best Friend';
  bool lock = false;
  Future<void> _selectDate(BuildContext context, String type) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;

        if (type == "des")

          // ignore: curly_braces_in_flow_control_structures
          savingDescription.text =
              '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
        if (type == "sav")
          // ignore: curly_braces_in_flow_control_structures
          savingDate.text =
              '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
        if (type == "start")
          // ignore: curly_braces_in_flow_control_structures
          startDate.text =
              '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
        if (type == "end")
          // ignore: curly_braces_in_flow_control_structures
          endDate.text =
              '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
      });
    }
  }

  Widget invitebuddy() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              'Invite your buddy',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              'An Invite will be sent to any of your buddy\n you add to this saving plan',
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xff413d95)),
            height: MediaQuery.of(context).size.height * .38,
            width: MediaQuery.of(context).size.height * .38,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Target Amount',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    '₦ ${savingAmount.text}',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'You are saving with ${savingCountController.text} buddies',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        'Start Date\n${startDate.text}',
                        style:
                            const TextStyle(fontSize: 19, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        'End Date\n  ${endDate.text}',
                        style:
                            const TextStyle(fontSize: 19, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    '2.5% \n P.A',
                    style: TextStyle(fontSize: 19, color: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        'Lock Saving? ',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    CupertinoSwitch(
                        // activeColor:  ,
                        value: lock,
                        onChanged: (v) {
                          setState(() {
                            lock = v;
                          });
                        })
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'You cannot unlock your savings until the maturity date',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ),
              ],
            )),
        Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * .35),
          child: Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              const Text('Add a buddy')
            ],
          ),
        )
      ],
    );
  }

  Widget buddyDetails() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              'How long do you and your buddy want to save for?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        myRadioButton(
          title: "3 Months",
          value: 0,
          groupValue: selectSavingTime,
          onChanged: (newValue) => setState(() => selectSavingTime = newValue),
        ),
        myRadioButton(
          title: "6 Months",
          value: 1,
          groupValue: selectSavingTime,
          onChanged: (newValue) => setState(() => selectSavingTime = newValue),
        ),
        myRadioButton(
          title: "1 Year",
          value: 2,
          groupValue: selectSavingTime,
          onChanged: (newValue) => setState(() => selectSavingTime = newValue),
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 0, top: 10),
                    child: Text(
                      'Start Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextFormField(
                    controller: startDate,
                    decoration: InputDecoration(
                      // prefix: prefix,
                      suffixIcon: GestureDetector(
                        onTap: () => _selectDate(context, 'start'),
                        child: const Icon(Icons.calendar_today_sharp),
                      ),
                      // icon: icon,
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: startDate.text.isNotEmpty
                                ? Colors.greenAccent
                                : Colors.red,
                            width: 1.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 0, top: 10),
                  child: Text(
                    'End Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextFormField(
                    controller: endDate,
                    decoration: InputDecoration(
                      // prefix: prefix,
                      suffixIcon: GestureDetector(
                        onTap: () => _selectDate(context, 'end'),
                        child: const Icon(Icons.calendar_today_sharp),
                      ),
                      // icon: icon,
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: startDate.text.isNotEmpty
                                ? Colors.greenAccent
                                : Colors.red,
                            width: 1.0),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              'Relationship with buddies',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
          padding: const EdgeInsets.only(left: 40),
          width: MediaQuery.of(context).size.width * .9,
          height: 40,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: relationship,
              borderRadius: BorderRadius.circular(20),
              icon: Transform.rotate(
                angle: 270 * math.pi / 180,
                child: const Icon(CupertinoIcons.back),
              ),
              items: <String>['Best Friend', 'Spouse', 'Classmate']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (v) {
                setState(() {
                  relationship = v!;
                });
              },
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        button(
          width: MediaQuery.of(context).size.width * 0.8,
          text: 'Next',
          onpressed: () {
            setState(() {
              selection++;
            });
          },
        )
      ],
    );
  }

  Widget intro() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              'Give you buddy saving a title',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: inputContainer(
                context: context, controller: titleSavingController),
          ),
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              'How many buddy will be saving with?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: inputContainer(
                context: context, controller: savingCountController),
          ),
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              'Do you and your buddies have a target?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        myRadioButton(
          title: "Yes",
          value: 0,
          groupValue: selectTarget,
          onChanged: (newValue) => setState(() => selectTarget = newValue),
        ),
        myRadioButton(
          title: "No",
          value: 1,
          groupValue: selectTarget,
          onChanged: (newValue) => setState(() => selectTarget = newValue),
        ),
        const SizedBox(
          height: 40,
        ),
        button(
          width: MediaQuery.of(context).size.width * 0.8,
          text: 'Next',
          onpressed: () {
            setState(() {
              selection++;
            });
          },
        )
      ],
    );
  }

  Widget savingCost() {
    return Column(children: [
      const Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 30, top: 10),
          child: Text(
            'How much do you want to save in 12 months?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      inputContainer(
          context: context, controller: savingAmount, prefix: const Text('₦')),
      const SizedBox(
        height: 30,
      ),
      const Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 30, top: 10),
          child: Text(
            'When do you want to start saving',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      inputContainer(
        context: context,
        controller: savingDate,
        icon: const Icon(Icons.calendar_today_sharp),
        onTapOnIcon: () => _selectDate(context, 'sav'),
      ),
      const SizedBox(
        height: 50,
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: button(
          width: MediaQuery.of(context).size.width * 0.8,
          text: 'Next',
          onpressed: () {
            setState(() {
              selection++;
            });
          },
        ),
      )
    ]);
  }

  Widget selectDetails() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              'How do you want to save?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () => {
                if (!automaticselected)
                  {
                    setState(
                      () {
                        automaticselected = true;
                      },
                    )
                  }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .4,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              automaticselected ? Colors.black : Colors.grey),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Column(children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Automatic ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'I will like to be\n debited automatically',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ]
                      // RichText(
                      //     text: const TextSpan(
                      //         children: [TextSpan(text: 'Automatic')]))
                      ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => {
                if (automaticselected)
                  {
                    setState(
                      () {
                        automaticselected = false;
                      },
                    )
                  }
              },
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1),
                child: Container(
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .4,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              !automaticselected ? Colors.black : Colors.grey),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Column(children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Automatic ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'I will like to be\n debited automatically',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              'What is your saving frequency?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        myRadioButton(
          title: "Daily",
          value: 0,
          groupValue: selectFrequency,
          onChanged: (newValue) => setState(() => selectFrequency = newValue),
        ),
        myRadioButton(
          title: "Weekly",
          value: 1,
          groupValue: selectFrequency,
          onChanged: (newValue) => setState(() => selectFrequency = newValue),
        ),
        myRadioButton(
          title: "Monthly",
          value: 2,
          groupValue: selectFrequency,
          onChanged: (newValue) => setState(() => selectFrequency = newValue),
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              'When do you want to start saving?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        inputContainer(
          context: context,
          controller: savingDescription,
          icon: const Icon(Icons.calendar_today_sharp),
          onTapOnIcon: () => _selectDate(context, 'des'),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: button(
            width: MediaQuery.of(context).size.width * 0.8,
            text: 'Next',
            onpressed: () {
              setState(() {
                selection++;
              });
            },
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> sections = [
      intro(),
      selectDetails(),
      savingCost(),
      buddyDetails(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buddy Savings',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
      backgroundColor: const Color.fromARGB(255, 215, 217, 223),
      body: selection == 4
          ? invitebuddy()
          : Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xff413d95),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(0),
                      )),
                  height: MediaQuery.of(context).size.height * 0.13,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            'assets/piggy.png',
                            height: 40,
                          )),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    Stack(
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            RichText(
                                text: const TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: 'Buddy Saving \n \n',
                                  style: TextStyle(
                                      color: Colors.white30,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text:
                                      'Share with family and friends on your next rent',
                                  style: TextStyle(
                                      color: Colors.white30,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w300)),
                            ])),
                          ],
                        ),
                      ],
                    )
                  ]),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * .2,
              ),
              sections[selection]
            ]),
    );
  }
}

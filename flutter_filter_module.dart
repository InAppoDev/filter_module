Padding(
                        padding: EdgeInsets.fromLTRB(screenSize.width * 0.05, 10, screenSize.width * 0.05, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Container(
                                width: screenSize.width * 0.25,
                                height: 40,
                                decoration: standartDecoration(ColorConstants.backgroundColor),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Фильтры",
                                      style:
                                          TextStyle(color: isFilterOn ? ColorConstants.blueBackground : Colors.black),
                                    ),
                                    Icon(
                                      Icons.tune,
                                      color: isFilterOn ? ColorConstants.blueBackground : Colors.black,
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  isFilterOn = !isFilterOn;
                                  selectedCountryValue = new Country(country: "Страны");
                                  selectedYear = 0;
                                  isCountryShown = false;
                                  isCountrySelected = false;
                                  isYearSelected = false;
                                  isYearShown = false;
                                });
                              },
                            ),
                            isFilterOn
                                ? PopupMenuButton(
                              padding: const EdgeInsets.all(0),
                                    onCanceled: () {
                                      setState(() {
                                        isCountryShown = false;
                                      });
                                    },
                                    child: Container(
                                        width: screenSize.width * 0.25,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: isCountryShown
                                                ? ColorConstants.blueBackground
                                                : ColorConstants.backgroundColor,
                                            borderRadius: BorderRadius.circular(10.0),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(125, 209, 205, 199),
                                                spreadRadius: 5,
                                                blurRadius: 5,
                                                offset: Offset(0, 3),
                                              )
                                            ]),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 5.0),
                                                child: Text(
                                                  selectedCountryValue.country,
                                                  softWrap: false,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: isCountryShown ? Colors.white : Colors.black),
                                                ),
                                              ),
                                            ),
                                            Icon(Icons.keyboard_arrow_down_rounded,
                                                color: isCountryShown ? Colors.white : Colors.black)
                                          ],
                                        )),
                                    offset: Offset(-screenSize.width*0.08, screenSize.height * 0.035),
                                    elevation: 0,
                                    color: Colors.yellow,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                    itemBuilder: (context) {
                                      setState(() {
                                        isCountryShown = true;
                                      });
                                      return <PopupMenuEntry<Widget>>[
                                        PopupMenuItem<Widget>(
                                          enabled: false,
                                          value: Text(selectedCountryValue.country),
                                          child: Align(
                                            alignment:Alignment.topLeft,
                                            child: Container(
                                              decoration: ShapeDecoration(
                                                  color: ColorConstants.blueBackground,
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                  shadows: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(30, 0, 0, 0),
                                                      blurRadius: 20,
                                                      offset: Offset(4, 4),
                                                    ),
                                                  ]),
                                              child: ListView.builder(
                                                padding: EdgeInsets.only(top: 20),
                                                itemCount: countries.length,
                                                itemBuilder: (context, index) {
                                                  final trans = countries[index];
                                                  isCountrySelected = trans == selectedCountryValue;

                                                  return GestureDetector(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(
                                                            index == countries.length - 1 ? 10.0 : 0.0),
                                                        color: isCountrySelected ? Colors.white : Colors.transparent,
                                                      ),
                                                      height: 30,
                                                      child: Center(
                                                        child: Text(
                                                          trans.country.toString(),
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: isCountrySelected
                                                                  ? ColorConstants.blueBackground
                                                                  : Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        selectedCountryValue = trans;
                                                        isCountrySelected = true;
                                                        Navigator.pop(context);
                                                      });
                                                    },
                                                  );
                                                },
                                              ),
                                              height: 250,
                                              width: screenSize.width*0.35,
                                            ),
                                          ),
                                        )
                                      ];
                                    })
                                : Container(),
                            isFilterOn
                                ? PopupMenuButton(
                                    onCanceled: () {
                                      setState(() {
                                        isYearShown = false;
                                      });
                                    },
                                    child: Container(
                                        width: screenSize.width * 0.25,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: isYearShown
                                                ? ColorConstants.blueBackground
                                                : ColorConstants.backgroundColor,
                                            borderRadius: BorderRadius.circular(10.0),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(125, 209, 205, 199),
                                                spreadRadius: 5,
                                                blurRadius: 5,
                                                offset: Offset(0, 3),
                                              )
                                            ]),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5.0),
                                              child: Text(
                                                selectedYear==0?"Год":selectedYear.toString(),
                                                style: TextStyle(color: isYearShown ? Colors.white : Colors.black),
                                              ),
                                            ),
                                            Icon(Icons.keyboard_arrow_down_rounded,
                                                color: isYearShown ? Colors.white : Colors.black)
                                          ],
                                        )),
                                    offset: Offset(screenSize.width*0.02, screenSize.height * 0.035),
                                    elevation: 0,
                                    color: Colors.yellow,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                    itemBuilder: (context) {
                                      setState(() {
                                        isYearShown = true;
                                      });
                                      return <PopupMenuEntry<Widget>>[
                                        PopupMenuItem<Widget>(
                                          enabled: false,
                                          value: Text(selectedYear==0?"Год":selectedYear.toString()),
                                          child: Align(
                                            alignment:Alignment.topRight,
                                            child: Container(
                                              decoration: ShapeDecoration(
                                                  color: ColorConstants.blueBackground,
                                                  shape:
                                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                  shadows: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(30, 0, 0, 0),
                                                      blurRadius: 20,
                                                      offset: Offset(4, 4),
                                                    ),
                                                  ]),
                                              child: ListView.builder(
                                                padding: EdgeInsets.only(top: 20),
                                                itemCount: years.length,
                                                itemBuilder: (context, index) {
                                                  final trans = years.elementAt(index);
                                                  isYearSelected = trans == selectedYear;

                                                  return GestureDetector(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(index == years.length - 1 ? 10.0 : 0.0),
                                                          bottomRight:
                                                              Radius.circular(index == years.length - 1 ? 10.0 : 0.0),
                                                        ),
                                                        color: isYearSelected ? Colors.white : Colors.transparent,
                                                      ),
                                                      height: 30,
                                                      child: Center(
                                                        child: Text(
                                                          trans.toString(),
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: isYearSelected
                                                                  ? ColorConstants.blueBackground
                                                                  : Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        selectedYear = trans;
                                                        isYearSelected = true;
                                                        Navigator.pop(context);
                                                      });
                                                    },
                                                  );
                                                },
                                              ),
                                              height: 150,
                                              width: screenSize.width * 0.25,
                                            ),
                                          ),
                                        )
                                      ];
                                    })
                                : Container()
                          ],
                        ),
                      )

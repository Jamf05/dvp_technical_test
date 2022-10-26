import 'package:flutter/material.dart';
import 'package:dvp_technical_test/core/page/base_bloc_state.dart';
import 'package:dvp_technical_test/core/settings/app_settings.dart';
import 'package:dvp_technical_test/core/validators/validators.dart';
import 'package:dvp_technical_test/features/app/custom/components/custom_app_bar.dart';
import 'package:dvp_technical_test/features/app/custom/components/custom_bottom_app_bar.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/button_widget.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/input_time_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:dvp_technical_test/features/app/blocs/date_selection_bloc/date_selection_bloc.dart';

class DateSelectionPage extends StatefulWidget {
  static const route = 'dateSelection';
  const DateSelectionPage({Key? key}) : super(key: key);
  @override
  DateSelectionPageState createState() => DateSelectionPageState();
}

class DateSelectionPageState extends BaseBlocState<DateSelectionPage,DateSelectionBloc> {
  // CalendarController? _calendarController;
  
  static final temp = DateTime.now().toString().split(' ');
  static final data = temp[0].split('-');

  String dateChange = '${data[2]}-${data[1]}-${data[0]}';
  String dateToAdd = '${data[2]}/${data[1]}/${data[0]}';

  TimeOfDay timeOfDayStartAtChange = TimeOfDay.now();
  TimeOfDay timeOfDayStartAtToAdd = TimeOfDay.now();
  TimeOfDay timeOfDayEndsAtAtChange = TimeOfDay.now();
  TimeOfDay timeOfDayEndsAtToAdd = TimeOfDay.now();

  @override
  void initState() {
    // _calendarController = CalendarController();
    super.initState();
  }

  @override
  void dispose() {
    // _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting(
      // !l10n.locale.languageCode
      'es_US'
    );

    //option = FCategoryDetailsModel(name: '');
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: const CustomBottomAppBar(),
      body: Builder(
        builder: (BuildContext buildContext) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 50.0,),
                Text(
                  "option.name ${l10n.dateSelectionTitle}",
                  style: AppFonts.promptR24,
                  textAlign: TextAlign.center,
                ),
                Text(
                  l10n.dateSelectionSubtitle,
                  style: AppFonts.promptR16,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30.0,),
                _calendar(),
                const SizedBox(height: 30.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }

/*
 
  ######     ###    ##       ######## ##    ## ########     ###    ########  
 ##    ##   ## ##   ##       ##       ###   ## ##     ##   ## ##   ##     ## 
 ##        ##   ##  ##       ##       ####  ## ##     ##  ##   ##  ##     ## 
 ##       ##     ## ##       ######   ## ## ## ##     ## ##     ## ########  
 ##       ######### ##       ##       ##  #### ##     ## ######### ##   ##   
 ##    ## ##     ## ##       ##       ##   ### ##     ## ##     ## ##    ##  
  ######  ##     ## ######## ######## ##    ## ########  ##     ## ##     ## 
 
*/

  Widget _calendar() {
    return SingleChildScrollView(
      child: TableCalendar(
    //! locale: l10n.locale.languageCode, 
    locale: 'es_CO', 
    // initialCalendarFormat: CalendarFormat.month,
    headerVisible: true,
    rowHeight: 50.0,
    firstDay: DateTime.now().add(const Duration(days: 30)),
    focusedDay: DateTime.now(),
    lastDay: DateTime.now().add(const Duration(days: -30)),
    daysOfWeekStyle: DaysOfWeekStyle(
      weekdayStyle: AppFonts.promptB18,
      weekendStyle: AppFonts.promptB18,
      // dowTextBuilder: (date, locale) => DateFormat.E(locale).format(date)[0].toUpperCase(),
    ),
    headerStyle: HeaderStyle(
      headerPadding: const EdgeInsets.all(0.0),
      headerMargin: const EdgeInsets.all(0.0),
      // centerHeaderTitle: true,
      formatButtonVisible: false,
      decoration: const BoxDecoration(
        color: AppColors.goldFirst,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)
        )
      ),
      leftChevronIcon:
          const Icon(Icons.arrow_back_ios, color: AppColors.blackFirst, size: 30.0),
      rightChevronIcon:
          const Icon(Icons.arrow_forward_ios, color: AppColors.blackFirst, size: 30.0),
      titleTextStyle: AppFonts.promptB20
    ),
    // calendarController: _calendarController,
    calendarStyle: CalendarStyle(
      // todayColor: AppColors.white,
      // selectedColor: AppColors.gold,
      todayTextStyle: AppFonts.promptB18,
      selectedTextStyle: AppFonts.promptB18,
      // weekdayStyle: AppFonts.calendarWeekdayStyle,
      weekendTextStyle: AppFonts.promptR18,
      // outsideHolidayStyle: AppFonts.calendarOutsideStyle,
      holidayTextStyle: AppFonts.promptR15,
      outsideTextStyle: AppFonts.promptR15,
      // outsideWeekendStyle: AppFonts.calendarOutsideStyle,
      // unavailableStyle: AppFonts.calendarOutsideStyle,
    ),
    onDaySelected: (date, _,) {
      if ( date.isAfter(DateTime.now()) || 
            (date.year == DateTime.now().year &&
            date.month == DateTime.now().month &&
            date.day == DateTime.now().day) ) {
        setState(() {
          final temp = date.toString().split(' ');
          final data = temp[0].split('-');
          dateChange = '${data[2]}-${data[1]}-${data[0]}';
          dateToAdd = '${data[0]}/${data[1]}/${data[2]}';
          // print(dateToAdd);
        });
        _displayBottomSheet();
      } else {
        show.scaffoldSnackbar(
          message: l10n.invalidDate,
          labelAction: l10n.closeWord
        );
      }
    },
      ),
    );
  }

/*
 
  ########      ######  ##     ## ######## ######## ######## 
  ##     ##    ##    ## ##     ## ##       ##          ##    
  ##     ##    ##       ##     ## ##       ##          ##    
  ########      ######  ######### ######   ######      ##    
  ##     ##          ## ##     ## ##       ##          ##    
  ##     ##    ##    ## ##     ## ##       ##          ##    
  ########      ######  ##     ## ######## ########    ##    
 
*/

  void _displayBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (childrenContext) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Container(
              height: size.height  * 0.3,
              margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        width: size.width*0.41,
                        child: Text(
                          l10n.selectATime,
                          style: AppFonts.promptR16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ButtonWidget(
                          text: l10n.saveWord,
                          onPressed: (){
                            if (!Validators.timeOfDay1IsAfter2(timeOfDayEndsAtAtChange,
                                                              timeOfDayStartAtChange)){

                                Navigator.pop(context);
                                show.scaffoldSnackbar(
                                  message: l10n.invalidTimeInterval,
                                  labelAction: l10n.closeWord
                                );
                                timeOfDayStartAtChange = TimeOfDay.now();
                                timeOfDayEndsAtAtChange = TimeOfDay.now();
                            } else {
                              // print(timeOfDayStartAtChange.hourOfPeriod);
                              // print(timeOfDayEndsAtAtChange.hour);
                              // print(dateToAdd);
                              // Navigator.pushNamed(
                              //     context, ChefFilterPage.route, arguments: [timeOfDayStartAtChange,dateToAdd]);
                            }
                          }
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InputTimeWidget(
                          width: 125,
                          label: l10n.startAt,
                          time: (timeOfDayStartAtChange.format(context)).toString(),
                          onTap: () async {
                            timeOfDayStartAtToAdd = await show.timePicker() ?? TimeOfDay.now();
                            if ( Validators.timeOfDayIsAfterNow(timeOfDayStartAtToAdd) ){
                              timeOfDayStartAtChange = timeOfDayStartAtToAdd;
                              setState(() {});
                            } else {
                              Navigator.pop(context);
                              show.scaffoldSnackbar(
                                message: l10n.invalidTime,
                                labelAction: l10n.closeWord
                              );
                            }
                          }
                        ),
                        InputTimeWidget(
                          width: 125,
                          label: l10n.endsAt,
                          time: (timeOfDayEndsAtAtChange.format(childrenContext)).toString(),
                          onTap: () async {
                            timeOfDayEndsAtToAdd = await show.timePicker() ?? TimeOfDay.now();
                            if ( Validators.timeOfDayIsAfterNow(timeOfDayEndsAtToAdd)){
                              timeOfDayEndsAtAtChange = timeOfDayEndsAtToAdd;
                              setState(() {});
                            } else {
                              Navigator.pop(context);
                              show.scaffoldSnackbar(
                                message: l10n.invalidTime,
                                labelAction: l10n.closeWord
                              );
                            }
                          }
                        )
                      ],
                    ),
                  )
                ],
              )
            );
          }
        );
      }
    );
  }
}
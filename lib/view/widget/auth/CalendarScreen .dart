import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthView extends StatefulWidget {
  final DateTime initialDate;

  const MonthView({super.key, required this.initialDate});

  @override
  _MonthViewState createState() => _MonthViewState();
}

class _MonthViewState extends State<MonthView> {
  late DateTime _currentMonth;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _currentMonth = DateTime(widget.initialDate.year, widget.initialDate.month);
    _selectedDate = widget.initialDate;
  }

  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
    });
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
    // Return the selected date when tapped in the dialog
    Navigator.pop(context, date);
  }

  List<Widget> _buildCalendarDays() {
    final int daysInMonth = DateTime(
      _currentMonth.year,
      _currentMonth.month + 1,
      0,
    ).day;
    final int firstDayOfWeek = DateTime(
      _currentMonth.year,
      _currentMonth.month,
      1,
    ).weekday;
    final List<Widget> dayWidgets = [];

    // Add empty containers for leading days
    for (int i = 0; i < firstDayOfWeek % 7; i++) {
      dayWidgets.add(Container());
    }

    // Add day numbers
    for (int i = 1; i <= daysInMonth; i++) {
      final DateTime date = DateTime(
        _currentMonth.year,
        _currentMonth.month,
        i,
      );
      final bool isSelected =
          date.day == _selectedDate.day &&
          date.month == _selectedDate.month &&
          date.year == _selectedDate.year;

      dayWidgets.add(
        GestureDetector(
          onTap: () => _onDateSelected(date),
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: isSelected
                ? const BoxDecoration(
                    color: Color.fromARGB(255, 236, 107, 71),
                    shape: BoxShape.circle,
                  )
                : null,
            child: Center(
              child: Text(
                '$i',
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return dayWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _previousMonth,
              ),
              Text(
                DateFormat('yyyy-MM-dd').format(_currentMonth),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: _nextMonth,
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 7,
            children: _buildCalendarDays(),
          ),
        ),
      ],
    );
  }
}

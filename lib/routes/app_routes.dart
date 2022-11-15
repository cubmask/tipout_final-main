part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;
  static const SETTINGS = _Paths.SETTINGS;
  static const EMPLOYEES = _Paths.EMPLOYEES;
  static const EMPLOYEEDETAILS = _Paths.EMPLOYEEDETAILS;
  static const ADDEMPLOYEEID = _Paths.ADDEMPLOYEEID;
  static const ADDEMPLOYEENUMBER = _Paths.ADDEMPLOYEENUMBER;
  static const ADDEMPLOYEEAVATAR = _Paths.ADDEMPLOYEEAVATAR;
  static const SCANEMPLOYEE = _Paths.SCANEMPLOYEE;
  static const SCANNING = _Paths.SCANNING;
  static const BATCHES = _Paths.BATCHES;
  static const BATCHDETAILS = _Paths.BATCHDETAILS;
  static const ACTIVITY = _Paths.ACTIVITY;
}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const SETTINGS = '/settings';
  static const EMPLOYEES = '/employees';
  static const EMPLOYEEDETAILS = '/employee/details';
  static const ADDEMPLOYEEID = '/employee/add/id';
  static const ADDEMPLOYEENUMBER = '/employee/add/number';
  static const ADDEMPLOYEEAVATAR = '/employee/add/avatar';
  static const SCANEMPLOYEE = '/employee/scan/employee';
  static const SCANNING = '/employee/scanning';
  static const BATCHES = '/batches';
  static const BATCHDETAILS = '/batch/details';
  static const ACTIVITY = '/activity';
}

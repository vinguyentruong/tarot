// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Opp! Something went wrong, please try again.`
  String get somethingWentWrong {
    return Intl.message(
      'Opp! Something went wrong, please try again.',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Connection error. Please check network and try again!`
  String get networkErrorMessage {
    return Intl.message(
      'Connection error. Please check network and try again!',
      name: 'networkErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `You’ve reached your selling limit, you can upgrade your plan to sell more.`
  String get serviceLimitReached {
    return Intl.message(
      'You’ve reached your selling limit, you can upgrade your plan to sell more.',
      name: 'serviceLimitReached',
      desc: '',
      args: [],
    );
  }

  /// `Watch tarot online`
  String get watchTarotOnline {
    return Intl.message(
      'Watch tarot online',
      name: 'watchTarotOnline',
      desc: '',
      args: [],
    );
  }

  /// `Find the answer to your problem with a practical spread.`
  String get homeHeader {
    return Intl.message(
      'Find the answer to your problem with a practical spread.',
      name: 'homeHeader',
      desc: '',
      args: [],
    );
  }

  /// `One tarot card`
  String get oneTarotCard {
    return Intl.message(
      'One tarot card',
      name: 'oneTarotCard',
      desc: '',
      args: [],
    );
  }

  /// `6 cards overview`
  String get sixCardsOverview {
    return Intl.message(
      '6 cards overview',
      name: 'sixCardsOverview',
      desc: '',
      args: [],
    );
  }

  /// `Yes or No`
  String get yesOrNo {
    return Intl.message(
      'Yes or No',
      name: 'yesOrNo',
      desc: '',
      args: [],
    );
  }

  /// `Fun`
  String get fun {
    return Intl.message(
      'Fun',
      name: 'fun',
      desc: '',
      args: [],
    );
  }

  /// `Love`
  String get love {
    return Intl.message(
      'Love',
      name: 'love',
      desc: '',
      args: [],
    );
  }

  /// `Questions`
  String get questions {
    return Intl.message(
      'Questions',
      name: 'questions',
      desc: '',
      args: [],
    );
  }

  /// `Tarots`
  String get tarots {
    return Intl.message(
      'Tarots',
      name: 'tarots',
      desc: '',
      args: [],
    );
  }

  /// `Draw cards`
  String get drawCards {
    return Intl.message(
      'Draw cards',
      name: 'drawCards',
      desc: '',
      args: [],
    );
  }

  /// `Notes before drawing tarot cards`
  String get noteBeforeDrawingCards {
    return Intl.message(
      'Notes before drawing tarot cards',
      name: 'noteBeforeDrawingCards',
      desc: '',
      args: [],
    );
  }

  /// `#1: Deep breath!`
  String get guideTitle1 {
    return Intl.message(
      '#1: Deep breath!',
      name: 'guideTitle1',
      desc: '',
      args: [],
    );
  }

  /// `#2: Focus on the question!`
  String get guideTitle2 {
    return Intl.message(
      '#2: Focus on the question!',
      name: 'guideTitle2',
      desc: '',
      args: [],
    );
  }

  /// `#3: Don't be afraid to try again and again!`
  String get guideTitle3 {
    return Intl.message(
      '#3: Don\'t be afraid to try again and again!',
      name: 'guideTitle3',
      desc: '',
      args: [],
    );
  }

  /// `#4: This is not math!`
  String get guideTitle4 {
    return Intl.message(
      '#4: This is not math!',
      name: 'guideTitle4',
      desc: '',
      args: [],
    );
  }

  /// `Before drawing, relax deeply.\nTry to relax your body and calm your mind.\nLet your thoughts come and go for a while without control.`
  String get guideContent1 {
    return Intl.message(
      'Before drawing, relax deeply.\nTry to relax your body and calm your mind.\nLet your thoughts come and go for a while without control.',
      name: 'guideContent1',
      desc: '',
      args: [],
    );
  }

  /// `Moments before drawing, focus your thoughts on the question or problem you are looking at.\nThe more effectively you focus on the present issue and clear other thoughts from your mind, the more insightful and accurate the reading will be.`
  String get guideContent2 {
    return Intl.message(
      'Moments before drawing, focus your thoughts on the question or problem you are looking at.\nThe more effectively you focus on the present issue and clear other thoughts from your mind, the more insightful and accurate the reading will be.',
      name: 'guideContent2',
      desc: '',
      args: [],
    );
  }

  /// `With an automated system like this, it is relatively difficult to create a strong energy connection between you and the cards (real readers will be easier).\nTherefore, you can completely retry a spread many times until you feel the connection between your energy and the cards is the best.\nHowever, be wise to avoid confusing strengthening the energy connection with choosing the results you want to see.`
  String get guideContent3 {
    return Intl.message(
      'With an automated system like this, it is relatively difficult to create a strong energy connection between you and the cards (real readers will be easier).\nTherefore, you can completely retry a spread many times until you feel the connection between your energy and the cards is the best.\nHowever, be wise to avoid confusing strengthening the energy connection with choosing the results you want to see.',
      name: 'guideContent3',
      desc: '',
      args: [],
    );
  }

  /// `Tarot is Occultism and it does not operate in a 1+1=2 manner like Mathematics.\nUse Tarot readings as a mirror to help you examine aspects of your life, feelings and thoughts at a certain time, be it the present, the past or the future. future.\nWhat Tarot brings will be extremely valuable if you consider it as information for reference before making your own big decisions.`
  String get guideContent4 {
    return Intl.message(
      'Tarot is Occultism and it does not operate in a 1+1=2 manner like Mathematics.\nUse Tarot readings as a mirror to help you examine aspects of your life, feelings and thoughts at a certain time, be it the present, the past or the future. future.\nWhat Tarot brings will be extremely valuable if you consider it as information for reference before making your own big decisions.',
      name: 'guideContent4',
      desc: '',
      args: [],
    );
  }

  /// `Tarot Detail`
  String get tarotDetail {
    return Intl.message(
      'Tarot Detail',
      name: 'tarotDetail',
      desc: '',
      args: [],
    );
  }

  /// `Draw again`
  String get drawAgain {
    return Intl.message(
      'Draw again',
      name: 'drawAgain',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

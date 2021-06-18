// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: Person.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers.h>
#else
 #import "GPBProtocolBuffers.h"
#endif

#if GOOGLE_PROTOBUF_OBJC_VERSION < 30004
#error This file was generated by a newer version of protoc which is incompatible with your Protocol Buffer library sources.
#endif
#if 30004 < GOOGLE_PROTOBUF_OBJC_MIN_SUPPORTED_VERSION
#error This file was generated by an older version of protoc which is incompatible with your Protocol Buffer library sources.
#endif

// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

CF_EXTERN_C_BEGIN

@class Animal;
@class Person_Result;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum Person_DeviceType

typedef GPB_ENUM(Person_DeviceType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  Person_DeviceType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  Person_DeviceType_Ios = 0,
  Person_DeviceType_Android = 1,
  Person_DeviceType_Wp = 2,
};

GPBEnumDescriptor *Person_DeviceType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL Person_DeviceType_IsValidValue(int32_t value);

#pragma mark - PersonRoot

/**
 * Exposes the extension registry for this file.
 *
 * The base class provides:
 * @code
 *   + (GPBExtensionRegistry *)extensionRegistry;
 * @endcode
 * which is a @c GPBExtensionRegistry that includes all the extensions defined by
 * this file and all files that it depends on.
 **/
GPB_FINAL @interface PersonRoot : GPBRootObject
@end

#pragma mark - Person

typedef GPB_ENUM(Person_FieldNumber) {
  Person_FieldNumber_Name = 1,
  Person_FieldNumber_Age = 2,
  Person_FieldNumber_DeviceType = 3,
  Person_FieldNumber_ResultsArray = 4,
  Person_FieldNumber_AnimalsArray = 5,
};

GPB_FINAL @interface Person : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

@property(nonatomic, readwrite) int32_t age;

/** 设备类型 */
@property(nonatomic, readwrite) Person_DeviceType deviceType;

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<Person_Result*> *resultsArray;
/** The number of items in @c resultsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger resultsArray_Count;

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<Animal*> *animalsArray;
/** The number of items in @c animalsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger animalsArray_Count;

@end

/**
 * Fetches the raw value of a @c Person's @c deviceType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t Person_DeviceType_RawValue(Person *message);
/**
 * Sets the raw value of an @c Person's @c deviceType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPerson_DeviceType_RawValue(Person *message, int32_t value);

#pragma mark - Person_Result

typedef GPB_ENUM(Person_Result_FieldNumber) {
  Person_Result_FieldNumber_URL = 1,
  Person_Result_FieldNumber_Title = 2,
};

GPB_FINAL @interface Person_Result : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *URL;

@property(nonatomic, readwrite, copy, null_resettable) NSString *title;

@end

#pragma mark - Animal

typedef GPB_ENUM(Animal_FieldNumber) {
  Animal_FieldNumber_Weight = 1,
  Animal_FieldNumber_Price = 2,
  Animal_FieldNumber_Namme = 3,
};

GPB_FINAL @interface Animal : GPBMessage

@property(nonatomic, readwrite) float weight;

@property(nonatomic, readwrite) double price;

@property(nonatomic, readwrite, copy, null_resettable) NSString *namme;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)

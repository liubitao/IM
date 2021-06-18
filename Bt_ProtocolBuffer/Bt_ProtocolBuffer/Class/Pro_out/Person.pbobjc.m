// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: Person.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import <stdatomic.h>

#import "Person.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wdollar-in-identifier-extension"

#pragma mark - Objective C Class declarations
// Forward declarations of Objective C classes that we can use as
// static values in struct initializers.
// We don't use [Foo class] because it is not a static value.
GPBObjCClassDeclaration(Animal);
GPBObjCClassDeclaration(Person);
GPBObjCClassDeclaration(Person_Result);

#pragma mark - PersonRoot

@implementation PersonRoot

// No extensions in the file and no imports, so no need to generate
// +extensionRegistry.

@end

#pragma mark - PersonRoot_FileDescriptor

static GPBFileDescriptor *PersonRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@""
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - Person

@implementation Person

@dynamic name;
@dynamic age;
@dynamic deviceType;
@dynamic resultsArray, resultsArray_Count;
@dynamic animalsArray, animalsArray_Count;

typedef struct Person__storage_ {
  uint32_t _has_storage_[1];
  int32_t age;
  Person_DeviceType deviceType;
  NSString *name;
  NSMutableArray *resultsArray;
  NSMutableArray *animalsArray;
} Person__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "name",
        .dataTypeSpecific.clazz = Nil,
        .number = Person_FieldNumber_Name,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(Person__storage_, name),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "age",
        .dataTypeSpecific.clazz = Nil,
        .number = Person_FieldNumber_Age,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(Person__storage_, age),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "deviceType",
        .dataTypeSpecific.enumDescFunc = Person_DeviceType_EnumDescriptor,
        .number = Person_FieldNumber_DeviceType,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(Person__storage_, deviceType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldHasEnumDescriptor | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "resultsArray",
        .dataTypeSpecific.clazz = GPBObjCClass(Person_Result),
        .number = Person_FieldNumber_ResultsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(Person__storage_, resultsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "animalsArray",
        .dataTypeSpecific.clazz = GPBObjCClass(Animal),
        .number = Person_FieldNumber_AnimalsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(Person__storage_, animalsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[Person class]
                                     rootClass:[PersonRoot class]
                                          file:PersonRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(Person__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown)];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\003\n\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t Person_DeviceType_RawValue(Person *message) {
  GPBDescriptor *descriptor = [Person descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:Person_FieldNumber_DeviceType];
  return GPBGetMessageRawEnumField(message, field);
}

void SetPerson_DeviceType_RawValue(Person *message, int32_t value) {
  GPBDescriptor *descriptor = [Person descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:Person_FieldNumber_DeviceType];
  GPBSetMessageRawEnumField(message, field, value);
}

#pragma mark - Enum Person_DeviceType

GPBEnumDescriptor *Person_DeviceType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "Ios\000Android\000Wp\000";
    static const int32_t values[] = {
        Person_DeviceType_Ios,
        Person_DeviceType_Android,
        Person_DeviceType_Wp,
    };
    static const char *extraTextFormatInfo = "\001\001\007\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(Person_DeviceType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:Person_DeviceType_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL Person_DeviceType_IsValidValue(int32_t value__) {
  switch (value__) {
    case Person_DeviceType_Ios:
    case Person_DeviceType_Android:
    case Person_DeviceType_Wp:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Person_Result

@implementation Person_Result

@dynamic URL;
@dynamic title;

typedef struct Person_Result__storage_ {
  uint32_t _has_storage_[1];
  NSString *URL;
  NSString *title;
} Person_Result__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "URL",
        .dataTypeSpecific.clazz = Nil,
        .number = Person_Result_FieldNumber_URL,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(Person_Result__storage_, URL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "title",
        .dataTypeSpecific.clazz = Nil,
        .number = Person_Result_FieldNumber_Title,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(Person_Result__storage_, title),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[Person_Result class]
                                     rootClass:[PersonRoot class]
                                          file:PersonRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(Person_Result__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown)];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\001!!!\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    [localDescriptor setupContainingMessageClass:GPBObjCClass(Person)];
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - Animal

@implementation Animal

@dynamic weight;
@dynamic price;
@dynamic namme;

typedef struct Animal__storage_ {
  uint32_t _has_storage_[1];
  float weight;
  NSString *namme;
  double price;
} Animal__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "weight",
        .dataTypeSpecific.clazz = Nil,
        .number = Animal_FieldNumber_Weight,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(Animal__storage_, weight),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeFloat,
      },
      {
        .name = "price",
        .dataTypeSpecific.clazz = Nil,
        .number = Animal_FieldNumber_Price,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(Animal__storage_, price),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeDouble,
      },
      {
        .name = "namme",
        .dataTypeSpecific.clazz = Nil,
        .number = Animal_FieldNumber_Namme,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(Animal__storage_, namme),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[Animal class]
                                     rootClass:[PersonRoot class]
                                          file:PersonRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(Animal__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown)];
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
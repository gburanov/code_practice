/*
 * java_init.h
 *
 *  Created on: Nov 30, 2013
 *      Author: gburanov
 */

#ifndef JAVA_INIT_H_
#define JAVA_INIT_H_

#include <jni.h>

#include <string>

JNIEnv* create_vm(const std::string& directory);
void invoke_class(JNIEnv* env, const std::string& className);

#endif /* JAVA_INIT_H_ */

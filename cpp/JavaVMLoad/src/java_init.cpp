#include "java_init.h"

#include <iostream>


JNIEnv* create_vm(const std::string& directory)
{
    JavaVM* jvm;
    JavaVMOption options[1];
    JavaVMInitArgs args;
    args.version = JNI_VERSION_1_6;
    args.nOptions = 1;
    std::string optionString("-Djava.class.path=");
    optionString.append(directory);
    options[0].optionString = (char*)optionString.c_str();
    args.options = options;
    args.ignoreUnrecognized = JNI_FALSE;

    JNIEnv* env;
    JNI_CreateJavaVM(&jvm, (void **)&env, &args);

    std::cout << "Java virtual machine created" << std::endl;
    return env;
}

void invoke_class(JNIEnv* env, const std::string& className)
{
    jclass helloWorldClass = env->FindClass(className.c_str());
    if (!helloWorldClass) {
    	std::cout << "Unable to find class " << className << std::endl;
    	return;
    }

    jmethodID mainMethod;
    mainMethod = env->GetStaticMethodID(helloWorldClass, "main", "([Ljava/lang/String;)V");
    if (!mainMethod) {
    	std::cout << "Unable to find method" << std::endl;
    	return;
    }
    env->CallStaticVoidMethod(helloWorldClass, mainMethod, 0);

}

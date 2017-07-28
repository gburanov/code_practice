#include "java_init.h"

#include <jni.h>

int main(int argc, char **argv) {

    JNIEnv* env = create_vm("/tmp/java");
    invoke_class(env, "TestClass");

}

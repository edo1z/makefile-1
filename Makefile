CPPFLAGS := -I src/includes -I src2/includes
BUILD_DIR := ./bin
SRC_DIRS := ./src ./src2
SRCS := $(shell find $(SRC_DIRS) -name *.cpp)
OBJS := $(addprefix $(BUILD_DIR)/, $(subst .cpp,.o, $(notdir $(SRCS))))

$(BUILD_DIR)/a: $(OBJS)
	clang++ -o $@ $^
$(BUILD_DIR)/%.o: src/%.cpp
	clang++ $(CPPFLAGS) -c -o $@ $<
$(BUILD_DIR)/%.o: src2/%.cpp
	clang++ $(CPPFLAGS) -c -o $@ $<

do:
	@bin/a
clean:
	rm -rf bin
	mkdir bin


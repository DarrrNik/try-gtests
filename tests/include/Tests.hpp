#ifndef TEST_HPP
#define TEST_HPP

#include "Math.hpp"
#include <gtest/gtest.h>

TEST(sum, PositiveNumbers) {
    EXPECT_EQ(sum(2, 3), 5);
    EXPECT_EQ(sum(10, 5), 15);
}

TEST(sum, NegativeNumbers) {
    EXPECT_EQ(sum(-2, -3), -5);
    EXPECT_EQ(sum(-10, -5), -15);
}

TEST(sum, MixedNumbers) {
    EXPECT_EQ(sum(2, -3), -1);
    EXPECT_EQ(sum(-10, 5), -5);
}

#endif
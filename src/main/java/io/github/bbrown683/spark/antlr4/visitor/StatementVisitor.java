package io.github.bbrown683.spark.antlr4.visitor;

import io.github.bbrown683.spark.antlr4.SparkBaseVisitor;
import io.github.bbrown683.spark.antlr4.SparkParser;

public class StatementVisitor extends SparkBaseVisitor<Object> {
	public Object visitStatement(SparkParser.StatementContext ctx) {
		return null;
	}
}

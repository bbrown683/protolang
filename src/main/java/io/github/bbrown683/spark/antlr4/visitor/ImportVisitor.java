package io.github.bbrown683.spark.antlr4.visitor;

import io.github.bbrown683.spark.antlr4.SparkBaseVisitor;
import io.github.bbrown683.spark.antlr4.SparkParser;

public class ImportVisitor extends SparkBaseVisitor<String> {
	@Override
	public String visitImportDeclaration(SparkParser.ImportDeclarationContext ctx) {
		return ctx.path().getText();
	}
}

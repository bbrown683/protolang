package io.github.bbrown683.spark.antlr4.visitor;

import io.github.bbrown683.spark.antlr4.SparkBaseVisitor;
import io.github.bbrown683.spark.antlr4.SparkParser;

public class PackageVisitor extends SparkBaseVisitor<String> {
	@Override
	public String visitPackageDeclaration(SparkParser.PackageDeclarationContext ctx) {
		return ctx.path().getText();
	}
}

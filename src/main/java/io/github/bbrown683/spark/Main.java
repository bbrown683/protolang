package io.github.bbrown683.spark;

import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;

import io.github.bbrown683.spark.antlr4.SparkLexer;
import io.github.bbrown683.spark.antlr4.SparkParser;

public class Main {
    public static void main(String[] args) {
        try {
        	CharStream charStream = CharStreams.fromStream(System.in);
            var lexer = new SparkLexer(charStream);
            var tokenStream = new CommonTokenStream(lexer);
            var parser = new SparkParser(tokenStream);
            ParseTree parseTree = parser.translationUnit();
            System.out.println(parseTree.toStringTree(parser));
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
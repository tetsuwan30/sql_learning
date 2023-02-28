# SQL-92
概要
* Major revision ([[ISO]] 9075), Entry Level SQL-92 adopted as [[FIPS]] 127-2
* メジャーな改訂([[ISO]] 9075)
* 1992年に、[[FIPS]] 127-2として採用された
* 詳細（英語）
  * http://www.contrib.andrew.cmu.edu/~shadow/sql/sql1992.txt

目次
- [SQL-92](#sql-92)
  - [Information Technology - Database Language SQL](#information-technology---database-language-sql)
  - [1. スコープ](#1-スコープ)
  - [3. 定義、記法、および慣例](#3-定義記法および慣例)
    - [3.1 定義](#31-定義)
      - [3.1.1 ISO/IEC 10646 からの定義](#311-isoiec-10646-からの定義)
      - [3.1.2 ISO 8601 からの定義](#312-iso-8601-からの定義)
      - [3.1.3 この規格で提供される定義](#313-この規格で提供される定義)
    - [3.2 記法](#32-記法)
    - [3.3 規約](#33-規約)
      - [3.3.1 Informative elements](#331-informative-elements)
      - [3.3.2 Specification of syntactic elements](#332-specification-of-syntactic-elements)
      - [3.3.3 Specification of the Information Schema](#333-specification-of-the-information-schema)
      - [3.3.4 Use of terms](#334-use-of-terms)
        - [3.3.4.1 Exceptions](#3341-exceptions)
        - [3.3.4.2 Syntactic containment](#3342-syntactic-containment)
        - [3.3.4.3 Terms denoting rule requirements](#3343-terms-denoting-rule-requirements)
        - [3.3.4.4 Rule evaluation order](#3344-rule-evaluation-order)
        - [3.3.4.5 Conditional rules](#3345-conditional-rules)
        - [3.3.4.6 Syntactic substitution](#3346-syntactic-substitution)
        - [3.3.4.7 Other terms](#3347-other-terms)
      - [3.3.5 Descriptors](#335-descriptors)
      - [3.3.6 Index typography](#336-index-typography)
    - [3.4  Object identifier for Database Language SQL](#34--object-identifier-for-database-language-sql)
  - [4. コンセプト](#4-コンセプト)
    - [4.1  Data types](#41--data-types)
    - [4.2  Character strings](#42--character-strings)
    - [4.2.1 Character strings and collating sequences](#421-character-strings-and-collating-sequences)
    - [4.2.2 Operations involving character strings](#422-operations-involving-character-strings)
    - [4.2.2 Operators that operate on character strings and return character strings](#422-operators-that-operate-on-character-strings-and-return-character-strings)
    - [4.2.2 Other operators involving character strings](#422-other-operators-involving-character-strings)
    - [4.2.3 Rules determining collating sequence usage](#423-rules-determining-collating-sequence-usage)
    - [4.3  Bit strings](#43--bit-strings)
    - [4.3.1 Bit string comparison and assignment](#431-bit-string-comparison-and-assignment)
    - [4.3.2 Operations involving bit strings](#432-operations-involving-bit-strings)
    - [4.3.2 Operators that operate on bit strings and return bit strings](#432-operators-that-operate-on-bit-strings-and-return-bit-strings)
    - [4.4  Numbers](#44--numbers)
    - [4.5  Datetimes and intervals](#45--datetimes-and-intervals)
  - [5. Lexical elements](#5-lexical-elements)
  - [6.  Scalar expressions](#6--scalar-expressions)
  - [7.  Query expressions](#7--query-expressions)
  - [8.  Predicates](#8--predicates)
    - [8.2 <comparison predicate> / 比較述語](#82-comparison-predicate--比較述語)
  - [9.  Data assignment rules](#9--data-assignment-rules)
  - [10. Additional common elements](#10-additional-common-elements)
  - [11. Schema definition and manipulation](#11-schema-definition-and-manipulation)
  - [12. Module](#12-module)
  - [13. Data manipulation](#13-data-manipulation)
  - [14. Transaction management](#14-transaction-management)
  - [15. Connection management](#15-connection-management)
  - [16. Session management](#16-session-management)
  - [17. Dynamic SQL](#17-dynamic-sql)
  - [19. Embedded SQL](#19-embedded-sql)
  - [20. Direct invocation of SQL](#20-direct-invocation-of-sql)
  - [21. Information Schema and Definition Schema](#21-information-schema-and-definition-schema)
  - [22. Status codes](#22-status-codes)
  - [23. Conformance](#23-conformance)

## Information Technology - Database Language SQL
## 1. スコープ
* この国際標準は、データ構造とSQLデータの基本操作を定義します。
* SQLデータの作成、アクセス、保守、制御、および保護のための機能を提供します。
* 注
  * この国際規格のフレームワークは、データ管理の参照モデル(ISO/IEC DIS 10032:1991)によって記述されています
* この国際標準は、データベース言語の構文とセマンティクスを指定します
  * SQLデータの構造と整合性制約を指定および変更するため
  * SQLデータとカーソルに対する操作の宣言と呼び出しのため
  * データベース言語手続きを宣言し、それらを標準プログラミング言語に埋め込むため
* また、SQL データの構造と整合性制約を記述する情報スキーマも指定します。
* この国際規格は、
  * SQL実装間のデータ定義とコンパイルユニットの移植性のための手段を提供し、
  * SQL実装の相互接続のための手段を提供します。
  * 特定のプログラミング言語の標準に準拠するコンパイル単位に SQLステートメントを埋め込むための構文を指定します。
* 特定のプログラミング言語標準に準拠する同等のコンパイル単位を導出する方法を定義します。
* その同等のコンパイル単位では、各組み込みSQLステートメントは、SQLステートメントを含むデータベース言語プロシージャーを呼び出すステートメントに置き換えられており、SQLステートメントの直接呼び出しの構文を指定します。
* この国際規格は、以下の方法または時間を定義していない
  * 次のいずれかの間のバインディング:
    * データベース管理システム コンポーネント、
    * SQL データ定義宣言、
    * SQL プロシージャ、または
    * 埋め込み SQL を含むものを含むコンパイル単位。
* この国際規格の実装は、アプリケーションプログラミング言語、エンドユーザークエリ言語、レポートジェネレータシステム、データ辞書システム、プログラムライブラリシステム、および分散型通信システム、ならびにデータベース設計やデータ管理、およびパフォーマンスの最適化のためのさまざまなツールを、サポートする環境に存在する場合があります。
## 3. 定義、記法、および慣例
### 3.1 定義
* この国際規格の目的のために、次の定義が適用されます。
#### 3.1.1 ISO/IEC 10646 からの定義
* この国際規格では、ISO/IEC 10646で定義されている次の用語を使用しています
  * a) character / [キャラクタ](https://ja.wikipedia.org/wiki/キャラクタ_(コンピュータ))
  * b) octet / [オクテット](https://ja.wikipedia.org/wiki/オクテット_(コンピュータ))
  * c) variable-length coding / 可変長コーディング
  * d) fixed-length coding / 固定長コーディング
#### 3.1.2 ISO 8601 からの定義
* この国際規格では、ISO 8601で定義されている次の用語を使用しています
  * a) Coordinated Universal Time (UTC) / 協定世界時
  * b) date ("date, calendar" in ISO 8601)
#### 3.1.3 この規格で提供される定義
* この国際規格は、次の用語を定義しています
* a) assignable / 割り当て可能性
  * 特定のデータ型のデータインスタンスにその値またはそのデータ型の値を割り当てることを許可する値またはデータ型の特性。
* b) cardinality (of a collection) / [カーディナリティ](https://qiita.com/soyanchu/items/034be19a2e3cb87b2efb)
  * そのコレクション内のオブジェクトの数。これらのオブジェクトは、必ずしも個別の値を持つ必要はありません。
* c) character repertoire; repertoire / キャラクターレパートリー
  * 特定の目的または用途に使用される一連の文字。各文字レパートリーには、暗黙のデフォルトの照合順序があります。
* d) coercibility / 強制性
  * 項目の照合順序の決定方法を制御する、文字ストリング・データ項目の属性。
* e) collation; collating sequence / 照合;照合順序
  * 比較可能な 2つの文字列を並べ替える方法。すべての文字セットにはデフォルトの照合があります。
* f) comparable / 同質性
  * 一方のオブジェクトの値を他方のオブジェクトの値と比較できるようにする2つのデータ オブジェクトの特性。
  * データ型についても言及: 
    * 2つのデータ型のオブジェクトが比較可能である場合、2つのデータ型は比較可能です。
* g) descriptor / [記述子](https://www.postgresql.jp/docs/9.2/ecpg-sql-set-descriptor.html)
  * SQLオブジェクトのコード化された説明。
  * これには、準拠するSQL実装に必要なオブジェクトに関するすべての情報が含まれています。
* h) distinct（ディスティンクト） /  別個のもの
  * 次の場合、2つの値は区別されない
    * 両方とも null値である
    * 8.2 項「<比較述語>」に従って等しいと比較される
  * そうでなければ、それらは区別されます。
  * それぞれの値のペアの少なくとも1つが異なる場合、2つの行 (または部分的な行) は区別されます。
  * そうでなければ、それらは区別されません。
  * 2つの値または 2つの行が異なるかどうかを評価した結果は、決して不明ではありません。
* i) duplicate / 重複
  * 2つ以上の値または行は、それらが別個のものでない場合に限り、（互いに）重複しています
* j) dyadic operator / 二項演算子
  * オペレータ / 演算子
  * オペランド / 被演算子
  * 二項演算子は、2つのオペランドを持つオペレータ
    * 左オペランドと右オペランド
    * この国際標準の2項算術演算子の例
      * "-"
        * 左オペランドから右オペランドを減算することを指定します。
* k) form-of-use / 使用する型
  * (文字列の中で)文字を表現するための規約 (またはエンコーディング)。
  * 使用形態には、固定長コーディングのものと、可変長コーディングのものがあります。
* l) form-of-use conversion / 使用する型の変換
  * 文字列をある使用する型から別の使用する型に変換する方法。
* m) implementation-defined / 実装定義
  * SQLの実装ごとに異なる可能性があるが、特定のSQL実装ごとに実装者が指定する。
* n) implementation-dependent / 実装依存
  * SQL 実装によって異なる可能性があるが，この国際標準では規定されておらず，特定の SQL実装のために実装者が規定することを要求されない。
* o) monadic operator
  * An operator having one operand. An example of a monadic arithmetic operator in this International Standard is
   "-", specifying the negation of the operand.
* p) multiset
  * An unordered collection of objects that are not neces-
   sarily distinct. The collection may be empty.
* q) n-adic operator
  * An operator having a variable number of operands (informally: n operands). An example of an n-adic operator in this International Standard is COALESCE.
* r) null value (null)
  * A special value, or mark, that is used to indicate the absence of any data value.
* s) persistent
  * Continuing to exist indefinitely, until destroyed deliberately. Referential and cascaded actions are regarded as deliberate. Actions incidental to the ending of an SQL-transaction (see Subclause 4.28, "SQL-transactions") or an SQL-session (see Subclause 4.30, "SQL-sessions") are not regarded as deliberate.
* t) redundant duplicates
  * All except one of any multiset of duplicate values or rows.
* u) repertoire
  * See character repertoire.
* v) sequence
  * An ordered collection of objects that are not necessarily distinct.
* w) set
  * An unordered collection of distinct objects. The collection may be empty.
* x) SQL-implementation
  * A database management system that conforms to this International Standard.
* y) translation
  * A method of translating characters in one character repertoire into characters of the same or a different character repertoire.
### 3.2 記法
* この国際標準で使用される構文表記法は、BNFの拡張バージョン (「Backus Naur Form」または「Backus Normal Form」) です。
* In BNF, each syntactic element of the language is defined by means of a production rule.
* This defines the element in terms of a formula consisting of the characters, character strings, and syntactic elements that can be used to form an instance of it.
* The version of BNF used in this International Standard makes use of the following symbols:
SymbolMeaning
< >   Angle brackets delimit character strings that are the names
      of syntactic elements, the non-terminal symbols of the SQL
      language.
::=   The definition operator. This is used in a production rule to
      separate the element defined by the rule from its definition.
      The element being defined appears to the left of the opera-
      tor and the formula that defines the element appears to the
      right.




         [ ]   Square brackets indicate optional elements in a formula. The
               portion of the formula within the brackets may be explicitly
               specified or may be omitted.

         { }   Braces group elements in a formula. The portion of the for-
               mula within the braces shall be explicitly specified.

         |     The alternative operator. The vertical bar indicates that
               the portion of the formula following the bar is an alterna-
               tive to the portion preceding the bar. If the vertical bar
               appears at a position where it is not enclosed in braces
               or square brackets, it specifies a complete alternative for
               the element defined by the production rule. If the vertical
               bar appears in a portion of a formula enclosed in braces or
               square brackets, it specifies alternatives for the contents
               of the innermost pair of such braces or brackets.

          . . . The ellipsis indicates that the element to which it applies
               in a formula may be repeated any number of times. If the el-
               lipsis appears immediately after a closing brace "}", then it
               applies to the portion of the formula enclosed between that
               closing brace and the corresponding opening brace "{". If
               an ellipsis appears after any other element, then it applies
               only to that element.

         !!    Introduces ordinary English text. This is used when the defi-
               nition of a syntactic element is not expressed in BNF.

         Spaces are used to separate syntactic elements. Multiple spaces and
         line breaks are treated as a single space. Apart from those symbols
         to which special functions were given above, other characters and
         character strings in a formula stand for themselves. In addition,
         if the symbols to the right of the definition operator in a produc-
         tion consist entirely of BNF symbols, then those symbols stand for
         themselves and do not take on their special meaning.

         Pairs of braces and square brackets may be nested to any depth,
         and the alternative operator may appear at any depth within such a
         nest.

         A character string that forms an instance of any syntactic element
         may be generated from the BNF definition of that syntactic element
         by application of the following steps:

         1) Select any one option from those defined in the right hand side
            of a production rule for the element, and replace the element
            with this option.

         2) Replace each ellipsis and the object to which it applies with
            one or more instances of that object.

         3) For every portion of the string enclosed in square brackets,
            either delete the brackets and their contents or change the
            brackets to braces.

         1) For every portion of the string enclosed in braces, apply steps
            1 through 5 to the substring between the braces, then remove the
            braces.

         2) Apply steps 1 through 5 to any non-terminal syntactic element
            (i.e., name enclosed in angle brackets) that remains in the
            string.

         The expansion or production is complete when no further non-
         terminal symbols remain in the character string.

         3.3  Conventions

         3.3.1  Informative elements

         In several places in the body of this International Standard, in-
         formative notes appear. For example:

         Note: This is an example of a note.
         Those notes do not belong to the normative part of this International
         Standard and conformance to material specified in those notes shall
         not be claimed.

         3.3.2  Specification of syntactic elements

         Syntactic elements are specified in terms of:

         -  Function: A short statement of the purpose of the element.

         -  Format: A BNF definition of the syntax of the element.

         -  Syntax Rules: A specification of the syntactic properties of the
            element, or of additional syntactic constraints, not expressed
            in BNF, that the element shall satisfy, or both.

         -  Access Rules: A specification of rules governing the accessibil-
            ity of schema objects that shall hold before the General Rules
            may be successfully applied.

         -  General Rules: A specification of the run-time effect of the
            element. Where more than one General Rule is used to specify the
            effect of an element, the required effect is that which would be
            obtained by beginning with the first General Rule and applying
            the Rules in numerical sequence unless a Rule is applied that
            specifies or implies a change in sequence or termination of the
            application of the Rules. Unless otherwise specified or implied
            by a specific Rule that is applied, application of General Rules
            terminates when the last in the sequence has been applied.

         -  Leveling Rules: A specification of how the element shall be
            supported for each of the levels of SQL.

         The scope of notational symbols is the Subclause in which those
         symbols are defined. Within a Subclause, the symbols defined in
         Syntax Rules, Access Rules, or General Rules can be referenced in
         other rules provided that they are defined before being referenced.

         3.3.3  Specification of the Information Schema

         The objects of the Information Schema in this International
         Standard are specified in terms of:

         -  Function: A short statement of the purpose of the definition.

         -  Definition: A definition, in SQL, of the object being defined.

         -  Description: A specification of the run-time value of the ob-
            ject, to the extent that this is not clear from the definition.

         The definitions used to define the views in the Information Schema
         are used only to specify clearly the contents of those viewed
         tables. The actual objects on which these views are based are
         implementation-dependent.

         3.3.4  Use of terms

         3.3.4.1  Exceptions

         The phrase "an exception condition is raised:", followed by the
         name of a condition, is used in General Rules and elsewhere to
         indicate that the execution of a statement is unsuccessful, ap-
         plication of General Rules, other than those of Subclause 12.3,
         "<procedure>", and Subclause 20.1, "<direct SQL statement>", may
         be terminated, diagnostic information is to be made available,
         and execution of the statement is to have no effect on SQL-data or
         schemas. The effect on <target specification>s and SQL descriptor
         areas of an SQL-statement that terminates with an exception condi-
         tion, unless explicitly defined by this International Standard, is
         implementation-dependent.

         The phrase "a completion condition is raised:", followed by the
         name of a condition, is used in General Rules and elsewhere to
         indicate that application of General Rules is not terminated and
         diagnostic information is to be made available; unless an excep-
         tion condition is also raised, the execution of the statement is
         successful.

         If more than one condition could have occurred as a result of a
         statement, it is implementation-dependent whether diagnostic infor-
         mation pertaining to more than one condition is made available.



         3.3.4.2  Syntactic containment

         In a Format, a syntactic element <A> is said to immediately contain
         a syntactic element <B> if <B> appears on the right-hand side of
         the BNF production rule for <A>. A syntactic element <A> is said
         to contain or specify a syntactic element <C> if <A> immediately
         contains <C> or if <A> immediately contains a syntactic element <B>
         that contains <C>.

         In SQL language, an instance A1 of <A> is said to immediately con-
         tain an instance B1 of <B> if <A> immediately contains <B> and the
         text of B1 is part of the text of A1. An instance A1 of <A> is said
         to contain or specify an instance C1 of <C> if A1 immediately con-
         tains C1 or if A1 immediately contains an instance B1 of <B> that
         contains C1.

         An instance A1 of <A> is said to contain an instance B1 of <B> with
         an intervening <C> if A1 contains B1 and A1 contains an instance C1
         of <C> that contains B1. An instance A1 of <A> is said to contain
         an instance B1 of <B> without an intervening <C> if A1 contains B1
         and A1 does not contain an instance C1 of <C> that contains B1.

         An instance A1 of <A> simply contains an instance B1 of <B> if
         A1 contains B1 without an intervening instance A2 of <A> or an
         intervening instance B2 of <B>.

         If <A> contains <B>, then <B> is said to be contained in <A> and
         <A> is said to be a containing production symbol for <B>. If <A>
         simply contains <B>, then <B> is said to be simply contained in
         <A> and <A> is said to be a simply containing production symbol for
         <B>.

         Let A1 be an instance of <A> and let B1 be an instance of <B>. If
         <A> contains <B>, then A1 is said to contain B1 and B1 is said to
         be contained in A1. If <A> simply contains <B>, then A1 is said to
         simply contain B1 and B1 is said to be simply contained in A1.

         An instance A1 of <A> is the innermost <A> satisfying a condition
         C if A1 satisfies C and A1 does not contain an instance A2 of <A>
         that satisfies C. An instance A1 of <A> is the outermost <A> satis-
         fying a condition C if A1 satisfies C and A1 is not contained in an
         instance A2 of <A> that satisfies C.

         If <A> contains a <table name> that identifies a view that is
         defined by a <view definition> V, then <A> is said to generally
         contain the <query expression> contained in V. If <A> contains <B>,
         then <A> generally contains <B>. If <A> generally contains <B> and
         <B> generally contains <C>, then <A> generally contains <C>.

         An instance A1 of <A> directly contains an instance B1 of <B> if A1
         contains B1 without an intervening <set function specification> or
         <subquery>.
         3.3 Conventions


         3.3.4.3  Terms denoting rule requirements

         In the Syntax Rules, the term shall defines conditions that are
         required to be true of syntactically conforming SQL language. When
         such conditions depend on the contents of the schema, then they
         are required to be true just before the actions specified by the
         General Rules are performed. The treatment of language that does
         not conform to the SQL Formats and Syntax Rules is implementation-
         dependent. If any condition required by Syntax Rules is not sat-
         isfied when the evaluation of Access or General Rules is attempted
         and the implementation is neither processing non-conforming SQL
         language nor processing conforming SQL language in a non-conforming
         manner, then an exception condition is raised: syntax error or
         access rule violation (if this situation occurs during dynamic ex-
         ecution of an SQL-statement, then the exception that is raised is
         syntax error or access rule violation in dynamic SQL statement; if
         the situation occurs during direct invocation of an SQL-statement,
         then the exception that is raised is syntax error or access rule
         violation in direct SQL statement).

         In the Access Rules, the term shall defines conditions that are
         required to be satisfied for the successful application of the
         General Rules. If any such condition is not satisfied when the
         General Rules are applied, then an exception condition is raised:
         syntax error or access rule violation (if this situation occurs
         during dynamic execution of an SQL-statement, then the exception
         that is raised is syntax error or access rule violation in dynamic
         SQL statement; if the situation occurs during direct invocation of
         an SQL-statement, then the exception that is raised is syntax error
         or access rule violation in direct SQL statement).

         In the Leveling Rules, the term shall defines conditions that are
         required to be true of SQL language for it to syntactically conform
         to the specified level of conformance.

         3.3.4.4  Rule evaluation order

         A conforming implementation is not required to perform the exact
         sequence of actions defined in the General Rules, but shall achieve
         the same effect on SQL-data and schemas as that sequence. The term
         effectively is used to emphasize actions whose effect might be
         achieved in other ways by an implementation.

         The Syntax Rules and Access Rules for contained syntactic elements
         are effectively applied at the same time as the Syntax Rules and
         Access Rules for the containing syntactic elements. The General
         Rules for contained syntactic elements are effectively applied be-
         fore the General Rules for the containing syntactic elements. Where
         the precedence of operators is determined by the Formats of this
         International Standard or by parentheses, those operators are ef-
         fectively applied in the order specified by that precedence. Where
         the precedence is not determined by the Formats or by parentheses,
         effective evaluation of expressions is generally performed from

 

         left to right. However, it is implementation-dependent whether ex-
         pressions are actually evaluated left to right, particularly when
         operands or operators might cause conditions to be raised or if
         the results of the expressions can be determined without completely
         evaluating all parts of the expression. In general, if some syn-
         tactic element contains more than one other syntactic element, then
         the General Rules for contained elements that appear earlier in the
         production for the containing syntactic element are applied before
         the General Rules for contained elements that appear later.

         For example, in the production:

            <A> ::= <B> <C>

         the Syntax Rules and Access Rules for <A>, <B>, and <C> are ef-
         fectively applied simultaneously. The General Rules for <B> are
         applied before the General Rules for <C>, and the General Rules for
         <A> are applied after the General Rules for both <B> and <C>.

         If the result of an expression or search condition can be deter-
         mined without completely evaluating all parts of the expression or
         search condition, then the parts of the expression or search condi-
         tion whose evaluation is not necessary are called the inessential
         parts. If the Access Rules pertaining to inessential parts are not
         satisfied, then the syntax error or access rule violation exception
         condition is raised regardless of whether or not the inessential
         parts are actually evaluated. If evaluation of the inessential
         parts would cause an exception condition to be raised, then it is
         implementation-dependent whether or not that exception condition is
         raised.

         3.3.4.5  Conditional rules

         Conditional rules are specified with "If" or "Case" conventions.
         Rules specified with "Case" conventions include a list of con-
         ditional sub-rules using "If" conventions. The first such "If"
         sub-rule whose condition is true is the effective sub-rule of
         the "Case" rule. The last sub-rule of a "Case" rule may specify
         "Otherwise". Such a sub-rule is the effective sub-rule of the
         "Case" rule if no preceding "If" sub-rule in the "Case" rule has
         a true condition.

         3.3.4.6  Syntactic substitution

         In the Syntax and General Rules, the phrase "X is implicit" indi-
         cates that the Syntax and General Rules are to be interpreted as if
         the element X had actually been specified.

         In the Syntax and General Rules, the phrase "the following <X> is
         implicit: Y" indicates that the Syntax and General Rules are to be
         interpreted as if a syntactic element <X> containing Y had actually
         been specified.


         In the Syntax Rules and General Rules, the phrase "former is equiv-
         alent to latter" indicates that the Syntax Rules and General Rules
         are to be interpreted as if all instances of former in the element
         had been instances of latter.

         If a BNF nonterminal is referenced in a Subclause without speci-
         fying how it is contained in a BNF production that the Subclause
         defines, then

         Case:

         -  If the BNF nonterminal is itself defined in the Subclause, then
            the reference shall be assumed to be the occurrence of that BNF
            nonterminal on the left side of the defining production.

         -  Otherwise, the reference shall be assumed to be to a BNF pro-
            duction in which the particular BNF nonterminal is immediately
            contained.

         3.3.4.7  Other terms

         Some Syntax Rules define terms, such as T1, to denote named or
         unnamed tables. Such terms are used as table names or correlation
         names. Where such a term is used as a correlation name, it does
         not imply that any new correlation name is actually defined for
         the denoted table, nor does it affect the scopes of any actual
         correlation names.

         An SQL-statement S1 is said to be executed as a direct result of
         executing an SQL-statement if S1 is the SQL-statement contained
         in a <procedure> that has been executed, or if S1 is the value of
         an <SQL statement variable> referenced by an <execute immediate
         statement> contained in a <procedure> that has been executed, or if
         S1 was the value of the <SQL statement variable> that was associ-
         ated with an <SQL statement name> by a <prepare statement> and that
         same <SQL statement name> is referenced by an <execute statement>
         contained in a <procedure> that has been executed.

         3.3.5  Descriptors

         A descriptor is a conceptual structured collection of data that
         defines the attributes of an instance of an object of a specified
         type. The concept of descriptor is used in specifying the seman-
         tics of SQL. It is not necessary that any descriptor exist in any
         particular form in any database or environment.

         Some SQL objects cannot exist except in the context of other SQL
         objects. For example, columns cannot exist except in tables. Those
         objects are independently described by descriptors, and the de-
         scriptors of enabling objects (e.g., tables) are said to include
         the descriptors of enabled objects (e.g., columns or table con-
         straints). Conversely, the descriptor of an enabled object is said
         to be included in the descriptor of an enabling object.

         In other cases, certain SQL objects cannot exist unless some other
         SQL object exists, even though there is not an inclusion relation-
         ship. For example, SQL does not permit an assertion to exist if the
         tables referenced by the assertion do not exist. Therefore, an as-
         sertion descriptor is dependent on or depends on zero or more table
         descriptors (equivalently, an assertion is dependent on or depends
         on zero or more tables). In general, a descriptor D1 can be said to
         depend on, or be dependent on, some descriptor D2.

         There are two ways of indicating dependency of one construct on
         another. In many cases, the descriptor of the dependent construct
         is said to "include the name of" the construct on which it is de-
         pendent. In this case "the name of" is to be understood as meaning
         "sufficient information to identify the descriptor of"; thus an
         implementor might choose to use a pointer or a concatenation of
         <catalog name>, <schema name>, etc. Alternatively, the descrip-
         tor may be said to include text (e.g., <query expression>, <search
         condition>). In such cases, whether the implementation includes ac-
         tual text (with defaults and implications made explicit) or its own
         style of parse tree is irrelevant; the validity of the descriptor
         is clearly "dependent on" the existence of descriptors for objects
         that are referred to in it.

         The statement that a column "is based on" a domain, is equivalent
         to a statement that a column "is dependent on" that domain.

         An attempt to destroy a descriptor may fail if other descriptors
         are dependent on it, depending on how the destruction is specified.
         Such an attempt may also fail if the descriptor to be destroyed
         is included in some other descriptor. Destruction of a descriptor
         results in the destruction of all descriptors included in it, but
         has no effect on descriptors on which it is dependent.

         3.3.6  Index typography

         In the Index to this International Standard, the following conven-
         tions are used:

         -  Index entries appearing in boldface indicate the page where the
            word, phrase, or BNF nonterminal was defined;

         -  Index entries appearing in italics indicate a page where the BNF
            nonterminal was used in a Format; and

         -  Index entries appearing in roman type indicate a page where
            the word, phrase, or BNF nonterminal was used in a heading,
            Function, Syntax Rule, Access Rule, General Rule, Leveling Rule,
            Table, or other descriptive text.

### 3.3 規約
#### 3.3.1 Informative elements
#### 3.3.2 Specification of syntactic elements
#### 3.3.3 Specification of the Information Schema
#### 3.3.4 Use of terms
##### 3.3.4.1 Exceptions
##### 3.3.4.2 Syntactic containment
##### 3.3.4.3 Terms denoting rule requirements
##### 3.3.4.4 Rule evaluation order
##### 3.3.4.5 Conditional rules
##### 3.3.4.6 Syntactic substitution
##### 3.3.4.7 Other terms
#### 3.3.5 Descriptors
#### 3.3.6 Index typography
### 3.4  Object identifier for Database Language SQL
## 4. コンセプト
### 4.1  Data types
### 4.2  Character strings
### 4.2.1 Character strings and collating sequences
### 4.2.2 Operations involving character strings
### 4.2.2 Operators that operate on character strings and return character strings
### 4.2.2 Other operators involving character strings
### 4.2.3 Rules determining collating sequence usage
### 4.3  Bit strings
### 4.3.1 Bit string comparison and assignment
### 4.3.2 Operations involving bit strings
### 4.3.2 Operators that operate on bit strings and return bit strings
4.3.2Other operators involving bit strings
### 4.4  Numbers
4.4.1Characteristics of numbers
4.4.2Operations involving numbers
### 4.5  Datetimes and intervals
4.5.1Datetimes
4.5.2Intervals
4.5.3Operations involving datetimes and intervals
4.6  Type conversions and mixing of data types
4.7  Domains
4.8  Columns
4.9  Tables
4.10 Integrity constraints
4.10.Checking of constraints
4.10.Table constraints
4.10.Domain constraints
4.10.Assertions
4.11 SQL-schemas
4.12 Catalogs
4.13 Clusters of catalogs
4.14 SQL-data
4.15 SQL-environment
4.16 Modules
4.17 Procedures
4.18 Parameters
4.18.Status parameters
4.18.Data parameters
4.18.Indicator parameters
4.19 Diagnostics area
4.20 Standard programming languages
4.21 Cursors
4.22 SQL-statements .............................................51
4.22.Classes of SQL-statements ..................................51
4.22.SQL-statements classified by function ......................52
4.22.Embeddable SQL-statements ..................................55
4.22.Preparable and immediately executable SQL-statements .......56
4.22.Directly executable SQL-statements .........................58
4.22.SQL-statements and transaction states ......................59
4.23 Embedded syntax ............................................61
4.24 SQL dynamic statements .....................................61
4.25 Direct invocation of SQL ...................................64
4.26 Privileges .................................................64
4.27 SQL-agents .................................................66
4.28 SQL-transactions ...........................................67
4.29 SQL-connections ............................................70
4.30 SQL-sessions ...............................................72
4.31 Client-server operation ....................................74
4.32 Information Schema .........................................75
4.33 Leveling ...................................................75
4.34 SQL Flagger
## 5. Lexical elements
5.1  <SQL terminal character> ...................................79
5.2  <token> and <separator> ....................................82
5.3  <literal> ..................................................89
5.4  Names and identifiers
## 6.  Scalar expressions
 ...........................................107
6.1  <data type> ................................................107
6.2  <value specification> and <target specification> ...........114
6.3  <table reference> ..........................................118
6.4  <column reference> .........................................121
6.5  <set function specification> ...............................124
6.6  <numeric value function> ...................................128
6.7  <string value function> ....................................132
6.8  <datetime value function> ..................................139
6.9  <case expression> ..........................................141
6.10 <cast specification> .......................................144
6.11 <value expression> .........................................155
6.12 <numeric value expression> .................................157
6.13 <string value expression> ..................................160
6.14 <datetime value expression> ................................165
6.15 <interval value expression>
 ................................168
## 7.  Query expressions
 ............................................173
7.1  <row value constructor> ....................................173
7.2  <table value constructor> ..................................176
7.3  <table expression> .........................................177
7.4  <from clause> ..............................................178
7.5  <joined table> .............................................180
7.6  <where clause> .............................................185
7.7  <group by clause> ..........................................187
7.8  <having clause> ............................................189
7.9  <query specification> ......................................191
7.10 <query expression> .........................................196
7.11 <scalar subquery>, <row subquery>, and <table subquery>
 ....203
## 8.  Predicates
 ...................................................205
8.1  <predicate> ................................................205

### 8.2 <comparison predicate> / 比較述語
* 2つの行の値の比較を指定します

8.3  <between predicate> ........................................211
8.4  <in predicate> .............................................212
8.5  <like predicate> ...........................................214
8.6  <null predicate> ...........................................218
8.7  <quantified comparison predicate> ..........................220
8.8  <exists predicate> .........................................222
8.9  <unique predicate> .........................................223
8.10 <match predicate> ..........................................224
8.11 <overlaps predicate> .......................................227
8.12 <search condition>
 .........................................229
## 9.  Data assignment rules
 ........................................231
9.1  Retrieval assignment .......................................231
9.2  Store assignment ...........................................234
9.3  Set operation result data types
 ............................237
## 10. Additional common elements
 ...................................239
10.1 <interval qualifier> .......................................239
10.2 <language clause> ..........................................243
10.3 <privileges> ...............................................245
10.4 <character set specification> ..............................248
10.5 <collate clause> ...........................................251
10.6 <constraint name definition> and <constraint attributes>
 ...252
## 11. Schema definition and manipulation
 ...........................255
11.1 <schema definition> ........................................255
11.2 <drop schema statement> ....................................258
11.3 <table definition> .........................................260
11.4 <column definition> ........................................262
11.5 <default clause> ...........................................266
11.6 <table constraint definition> ..............................270
11.7 <unique constraint definition> .............................272
11.8 <referential constraint definition> ........................274
11.9 <check constraint definition> ..............................281
11.10<alter table statement> ....................................283
11.11<add column definition> ....................................284
11.12<alter column definition> ..................................286
11.13<set column default clause> ................................287
11.14<drop column default clause> ...............................288
11.15<drop column definition> ...................................289
11.16<add table constraint definition> ..........................291
11.17<drop table constraint definition> .........................292
11.18<drop table statement> .....................................294
11.19<view definition> ..........................................296
11.20<drop view statement> ......................................300
11.21<domain definition> ........................................301
11.22<alter domain statement> ...................................304
11.23<set domain default clause> ................................305
                                               Table of Contents  v


11.24<drop domain default clause> ...............................306
11.25<add domain constraint definition> .........................307
11.26<drop domain constraint definition> ........................308
11.27<drop domain statement> ....................................309
11.28<character set definition> .................................311
11.29<drop character set statement> .............................313
11.30<collation definition> .....................................314
11.31<drop collation statement> .................................318
11.32<translation definition> ...................................320
11.33<drop translation statement> ...............................323
11.34<assertion definition> .....................................325
11.35<drop assertion statement> .................................328
11.36<grant statement> ..........................................329
11.37<revoke statement>
 .........................................333
## 12. Module
 .......................................................341
12.1 <module> ...................................................341
12.2 <module name clause> .......................................344
12.3 <procedure> ................................................346
12.4 Calls to a <procedure> .....................................352
12.5 <SQL procedure statement> ..................................368
## 13. Data manipulation
 ............................................371
13.1 <declare cursor> ...........................................371
13.2 <open statement> ...........................................375
13.3 <fetch statement> ..........................................377
13.4 <close statement> ..........................................381
13.5 <select statement: single row> .............................382
13.6 <delete statement: positioned> .............................384
13.7 <delete statement: searched> ...............................386
13.8 <insert statement> .........................................388
13.9 <update statement: positioned> .............................391
13.10<update statement: searched> ...............................394
13.11<temporary table declaration>
 ..............................397
## 14. Transaction management
 .......................................399
14.1 <set transaction statement> ................................399
14.2 <set constraints mode statement> ...........................401
14.3 <commit statement> .........................................403
14.4 <rollback statement> .......................................405

## 15. Connection management
 ........................................407
15.1 <connect statement> ........................................407
15.2 <set connection statement> .................................410
15.3 <disconnect statement> .....................................412



## 16. Session management
 ...........................................415
16.1 <set catalog statement> ....................................415
16.2 <set schema statement> .....................................417
16.3 <set names statement> ......................................419
16.4 <set session authorization identifier statement> ...........420
16.5 <set local time zone statement>
 ............................422
## 17. Dynamic SQL
 ..................................................425
17.1 Description of SQL item descriptor areas ...................425
17.2 <allocate descriptor statement> ............................431
17.3 <deallocate descriptor statement> ..........................433
17.4 <get descriptor statement> .................................434
17.5 <set descriptor statement> .................................438
17.6 <prepare statement> ........................................442
17.7 <deallocate prepared statement> ............................449
17.8 <describe statement> .......................................450
17.9 <using clause> .............................................451
17.10<execute statement> ........................................459
17.11<execute immediate statement> ..............................462
17.12<dynamic declare cursor> ...................................464
17.13<allocate cursor statement> ................................465
17.14<dynamic open statement> ...................................467
17.15<dynamic fetch statement> ..................................469
17.16<dynamic close statement> ..................................471
17.17<dynamic delete statement: positioned> .....................472
17.18<dynamic update statement: positioned> .....................474
17.19<preparable dynamic delete statement: positioned> ..........476
17.20<preparable dynamic update statement: positioned>
 ..........477
18 Diagnostics management
 .......................................479
18.1 <get diagnostics statement>
 ................................479
## 19. Embedded SQL
 .................................................489
19.1 <embedded SQL host program> ................................489
19.2 <embedded exception declaration> ...........................497
19.3 <embedded SQL Ada program> .................................500
19.4 <embedded SQL C program> ...................................504
19.5 <embedded SQL COBOL program> ...............................508
19.6 <embedded SQL Fortran program> .............................512
19.7 <embedded SQL MUMPS program> ...............................515
19.8 <embedded SQL Pascal program> ..............................517
19.9 <embedded SQL PL/I program>
 ................................520
## 20. Direct invocation of SQL
 .....................................525
20.1 <direct SQL statement> .....................................525
20.2 <direct select statement: multiple rows> ...................530
                                             Table of Contents  vii


## 21. Information Schema and Definition Schema
 .....................533
21.1 Introduction ...............................................533
21.2 Information Schema .........................................535
21.2.INFORMATION_SCHEMA Schema ..................................535
21.2.INFORMATION_SCHEMA_CATALOG_NAME base table .................536
21.2.INFORMATION_SCHEMA_CATALOG_NAME_CARDINALITY assertion ......537
21.2.SCHEMATA view ..............................................538
21.2.DOMAINS view ...............................................539
21.2.DOMAIN_CONSTRAINTS view ....................................541
21.2.TABLES view ................................................542
21.2.VIEWS view .................................................543
21.2.COLUMNS view ...............................................544
21.2.TABLE_PRIVILEGES view ......................................546
21.2.COLUMN_PRIVILEGES view .....................................547
21.2.USAGE_PRIVILEGES view ......................................548
21.2.TABLE_CONSTRAINTS view .....................................549
21.2.REFERENTIAL_CONSTRAINTS view ...............................550
21.2.CHECK_CONSTRAINTS view .....................................551
21.2.KEY_COLUMN_USAGE view ......................................552
21.2.ASSERTIONS view ............................................553
21.2.CHARACTER_SETS view ........................................554
21.2.COLLATIONS view ............................................555
21.2.TRANSLATIONS view ..........................................556
21.2.VIEW_TABLE_USAGE view ......................................557
21.2.VIEW_COLUMN_USAGE view .....................................558
21.2.CONSTRAINT_TABLE_USAGE view ................................559
21.2.CONSTRAINT_COLUMN_USAGE view ...............................561
21.2.COLUMN_DOMAIN_USAGE view ...................................562
21.2.SQL_LANGUAGES view .........................................563
21.2.SQL_IDENTIFIER domain ......................................564
21.2.CHARACTER_DATA domain ......................................564
21.2.CARDINAL_NUMBER domain .....................................565
21.3 Definition Schema ..........................................566
21.3.Introduction ...............................................566
21.3.DEFINITION_SCHEMA Schema ...................................567
21.3.USERS base table ...........................................568
21.3.SCHEMATA base table ........................................569
21.3.DATA_TYPE_DESCRIPTOR base table ............................570
21.3.DOMAINS base table .........................................573
21.3.DOMAIN_CONSTRAINTS base table ..............................574
21.3.TABLES base table ..........................................576
21.3.VIEWS base table ...........................................578
21.3.COLUMNS base table .........................................580
21.3.VIEW_TABLE_USAGE base table ................................583
21.3.VIEW_COLUMN_USAGE base table ...............................584
viii  Database Language SQL


21.3.TABLE_CONSTRAINTS base table ...............................585
21.3.KEY_COLUMN_USAGE base table ................................588
21.3.REFERENTIAL_CONSTRAINTS base table .........................590
21.3.CHECK_CONSTRAINTS base table ...............................593
21.3.CHECK_TABLE_USAGE base table ...............................595
21.3.CHECK_COLUMN_USAGE base table ..............................596
21.3.ASSERTIONS base table ......................................598
21.3.TABLE_PRIVILEGES base table ................................600
21.3.COLUMN_PRIVILEGES base table ...............................602
21.3.USAGE_PRIVILEGES base table ................................604
21.3.CHARACTER_SETS base table ..................................606
21.3.COLLATIONS base table ......................................608
21.3.TRANSLATIONS base table ....................................610
21.3.SQL_LANGUAGES base table ...................................612
21.4 Assertions on the base tables ..............................616
21.4.UNIQUE_CONSTRAINT_NAME assertion ...........................616
21.4.EQUAL_KEY_DEGREES assertion ................................617
21.4.KEY_DEGREE_GREATER_THAN_OR_EQUAL_TO_1 assertion ............618

## 22. Status codes
 .................................................619
22.1 SQLSTATE ...................................................619
22.2 SQLCODE ....................................................624

## 23. Conformance
 ..................................................625
23.1 Introduction ...............................................625
23.2 Claims of conformance ......................................625
23.3 Extensions and options .....................................626
23.4 Flagger requirements .......................................626
23.5 Processing methods .........................................627
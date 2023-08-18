import { IConstruct } from "constructs";

const DISPLAY_SYMBOL = Symbol.for("@winglang/sdk.std.Display");

/**
 * Information on how to display a construct in a user interface
 * such as the Wing Console.
 */
export class Display {
  /**
   * The source module for the SDK.
   */
  public static readonly SDK_SOURCE_MODULE = "@winglang/sdk";

  /**
   * Return the matching Display instance of the given construct.
   */
  public static of(construct: IConstruct): Display {
    let display = (construct as any)[DISPLAY_SYMBOL];

    if (!display) {
      display = new Display();
      (construct as any)[DISPLAY_SYMBOL] = display;
    }

    return display;
  }

  /**
   * Title of the construct.
   */
  public title?: string;

  /**
   * Description of the construct.
   */
  public description?: string;

  /**
   * The source file or library where the construct was defined.
   */
  public sourceModule?: string;

  /**
   * Whether the construct should be hidden by default in the user interface.
   */
  public hidden?: boolean;

  private constructor() {}
}
export = PassKitHelper;
export as namespace PassKitHelper;

declare namespace PassKitHelper {
  /**
   * Use for disable apple pay
   * iOS Only
   *
   */
  export function suppressApplePay(): void;

  /**
   * Use for enable apple pay
   * iOS Only
   *
   */
  export function enableApplePay(): void;
}
